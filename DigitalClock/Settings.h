//
//  Settings.h
//  DigitalClock
//
//  Created by Qasim Abbas on 5/31/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Settings : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *btnGreen;
@property (weak, nonatomic) IBOutlet UIButton *btnRed;
@property (weak, nonatomic) IBOutlet UIButton *btnPurple;
@property (weak, nonatomic) IBOutlet UIButton *btnDarkGreen;
- (IBAction)btnGreenAction:(id)sender;
- (IBAction)btnRedAction:(id)sender;
- (IBAction)btnPurpleAction:(id)sender;
- (IBAction)btnDarkGreenAction:(id)sender;
- (IBAction)btnSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *btnSwitchState;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, retain)NSUserDefaults *userDefaults;
- (IBAction)btnDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)btnTimeZone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeZoneName;

@property (nonatomic, retain)NSArray *timeZones;

@end
