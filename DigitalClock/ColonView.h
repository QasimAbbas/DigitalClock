//
//  ColonView.h
//  DigitalClock
//
//  Created by Qasim Abbas on 5/29/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColonView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

-(void)setColor:(UIColor*)color;
@end
