//
//  ViewController.h
//  DigitalClock
//
//  Created by Qasim Abbas on 5/25/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Digit.h"
#import "ColonView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet Digit *hourOne;
@property (weak, nonatomic) IBOutlet Digit *hourTwo;
@property (weak, nonatomic) IBOutlet Digit *MinuteOne;
@property (weak, nonatomic) IBOutlet Digit *MinuteTwo;
@property (weak, nonatomic) IBOutlet Digit *secondsOne;
@property (weak, nonatomic) IBOutlet Digit *secondsTwo;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeOfDay;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet ColonView *colon;

@property (nonatomic, retain)NSDate *today;
@property (nonatomic, retain)NSDateFormatter *formatter;

@property (nonatomic, retain)NSUserDefaults *userDefaults;
@property (strong)NSString *colorString;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end


