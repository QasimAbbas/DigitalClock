//
//  Digit.h
//  DigitalClock
//
//  Created by Qasim Abbas on 5/25/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Digit : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;
@property (weak, nonatomic) IBOutlet UIView *topLeftBar;
@property (weak, nonatomic) IBOutlet UIView *topRightBar;
@property (weak, nonatomic) IBOutlet UIView *middleBar;
@property (weak, nonatomic) IBOutlet UIView *bottomRightBar;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftBar;

-(void)numZero;
-(void)numOne;
-(void)numTwo;
-(void)numThree;
-(void)numFour;
-(void)numFive;
-(void)numSix;
-(void)numSeven;
-(void)numEight;
-(void)numNine;
-(void)hideBars;
-(void)setColor:(UIColor *)color;

@end
