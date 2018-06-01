//
//  Settings.m
//  DigitalClock
//
//  Created by Qasim Abbas on 5/31/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import "Settings.h"
#import "Color.h"

@interface Settings ()

@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    [_pickerView setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    
    _timeZones = [NSTimeZone knownTimeZoneNames];
    
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    [_btnTimeZoneName setTitle:[_userDefaults objectForKey:@"timeZone"] forState:UIControlStateNormal];
    
    _btnGreen.backgroundColor = Color.green;
    _btnRed.backgroundColor = Color.red;
    _btnPurple.backgroundColor = Color.purple;
    _btnDarkGreen.backgroundColor = Color.darkGreen;
    
    
    [self isOn];
    
    [self imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGreenAction:(id)sender {
    
    NSLog(@"Button Pushed");
    
    [_userDefaults setObject:@"green" forKey:@"color"];
}

- (IBAction)btnRedAction:(id)sender {
    [_userDefaults setObject:@"red" forKey:@"color"];
}

- (IBAction)btnPurpleAction:(id)sender {
    
    [_userDefaults setObject:@"purple" forKey:@"color"];
}

- (IBAction)btnDarkGreenAction:(id)sender {
    
     [_userDefaults setObject:@"darkGreen" forKey:@"color"];
}

- (IBAction)btnSwitch:(id)sender {
    
    if(_btnSwitchState.on){
        
        [_userDefaults setObject:@"HH" forKey:@"timeFormat"];
    }else{
        
        [_userDefaults setObject:@"hh" forKey:@"timeFormat"];
    }
   
}

-(void)isOn{
    NSString * format = [_userDefaults objectForKey:@"timeFormat"];
    if([format isEqualToString:@"hh"]){
        
        [_btnSwitchState setOn:false];
    }else{
        
         [_btnSwitchState setOn:true];
    }
    
}

-(void)imageView{
      _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-clock-background-%li", [_userDefaults integerForKey:@"img"]]];
    
    UISwipeGestureRecognizer *rightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
    [rightGestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:rightGestureRecognizer];
    
    
    UISwipeGestureRecognizer *leftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
    
    [leftGestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:leftGestureRecognizer];
    
}


-(void)swipeHandlerRight:(id) sender{
    
    if([_userDefaults integerForKey:@"img"] < 10){
        [_userDefaults integerForKey:@"img"];
        [_userDefaults setInteger:([_userDefaults integerForKey:@"img"] + 1) forKey:@"img"];
        
    }else{
        [_userDefaults setInteger:1 forKey:@"img"];
    }
    
    NSLog(@"IMAGE NUMBER: %li", [_userDefaults integerForKey:@"img"]);
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-clock-background-%li", [_userDefaults integerForKey:@"img"]]];
    
}

-(void)swipeHandlerLeft:(id) sender{
    
    if([_userDefaults integerForKey:@"img"] > 1){
        [_userDefaults integerForKey:@"img"];
        [_userDefaults setInteger:([_userDefaults integerForKey:@"img"] - 1) forKey:@"img"];
        
    }else{
        [_userDefaults setInteger:10 forKey:@"img"];
    }
    
    NSLog(@"IMAGE NUMBER: %li", [_userDefaults integerForKey:@"img"]);
    
    _imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img-clock-background-%li", [_userDefaults integerForKey:@"img"]]];
    
}

- (IBAction)btnDone:(id)sender {
    
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)btnTimeZone:(id)sender {
    
    [_pickerView setHidden:false];
    
}
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _timeZones.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return _timeZones[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [_userDefaults setObject:_timeZones[row] forKey:@"timeZone"];
    [_userDefaults synchronize];
    
    [_btnTimeZoneName setTitle:[_userDefaults objectForKey:@"timeZone"] forState:UIControlStateNormal];
    NSLog(@"SELECTED %@", _timeZones[row]);
    
}




@end
