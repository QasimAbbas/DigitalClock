//
//  ViewController.m
//  DigitalClock
//
//  Created by Qasim Abbas on 5/25/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import "ViewController.h"
#import "Color.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [self loadSettings];
    [self imageView];
    [self color];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadSettings];
    [self imageView];
    [self color];
   

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadSettings{
    _today = [[NSDate alloc] init];
    _formatter = [[NSDateFormatter alloc] init];
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setTime) userInfo:nil repeats:YES];
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

-(void)setTime{
    
    
    
    [self setDateAndTimeOfDay];
    
    
    [_formatter setTimeZone:[NSTimeZone timeZoneWithName:[_userDefaults objectForKey:@"timeZone"]]];
    
    [_formatter setDateFormat:[_userDefaults objectForKey:@"timeFormat"]];
    NSInteger time = [_formatter stringFromDate:_today].integerValue;
    
    [self displayNumber:_hourOne num: time %100 /10];
    [self displayNumber:_hourTwo num:time % 10];
    
    [_formatter setDateFormat:@"mm"];
    time = [_formatter stringFromDate:_today].integerValue;
    [self displayNumber:_MinuteOne num: time %100 /10];
    [self displayNumber:_MinuteTwo num:time % 10];
    
     [_formatter setDateFormat:@"ss"];
    time = [_formatter stringFromDate:_today].integerValue;

    [self displayNumber:_secondsOne num: time %100 /10];
    [self displayNumber:_secondsTwo num:time % 10];
    
    
}

-(void)color{
    UIColor *color = [[UIColor alloc] init];
    _colorString = [_userDefaults objectForKey:@"color"];
   
    if([_colorString isEqualToString:@"green"]){
        color = Color.green;
    }else if([_colorString isEqualToString:@"red"]){
        color = Color.red;
    }else if([_colorString isEqualToString:@"purple"]){
        color = Color.purple;
    }else if([_colorString isEqualToString:@"darkGreen"]){
        color = Color.darkGreen;
    }
    
    
    
    _lblDay.textColor = color;
    _lblTimeOfDay.textColor = color;
    
    [_colon setColor: color];
    [_hourOne setColor: color];
    [_hourTwo setColor:color];
    [_MinuteOne setColor:color];
    [_MinuteTwo setColor:color];
    [_secondsOne setColor:color];
    [_secondsTwo setColor:color];
    
    
}

-(void)displayNumber:(Digit *)digit num:(NSInteger)num{
    
    switch (num) {
        case 0:
            [digit numZero];
            break;
        case 1:
            [digit numOne];
            break;
        case 2:
            [digit numTwo];
            break;
        case 3:
            [digit numThree];
            break;
        case 4:
            [digit numFour];
            break;
        case 5:
            [digit numFive];
            break;
        case 6:
            [digit numSix];
            break;
        case 7:
            [digit numSeven];
            break;
        case 8:
            [digit numEight];
            break;
        case 9:
            [digit numNine];
            break;
        default:
            break;
    }
}

-(void)setDateAndTimeOfDay{
    _today = [[NSDate alloc]init];
    
    
    
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"EEEE MMM d"];
    
    _lblDay.text = [_formatter stringFromDate:_today];
    
    
    [_formatter setDateFormat:@"a"];
    _lblTimeOfDay.text = [_formatter stringFromDate:_today];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


@end
