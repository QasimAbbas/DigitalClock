//
//  Digit.m
//  DigitalClock
//
//  Created by Qasim Abbas on 5/25/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import "Digit.h"

@implementation Digit

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
    
    
}

-(void)setColor:(UIColor*)color{
    
    [self.topBar setBackgroundColor:color];
    [self.topLeftBar setBackgroundColor:color];
    [self.topRightBar setBackgroundColor:color];
    [self.middleBar setBackgroundColor:color];
    [self.bottomLeftBar setBackgroundColor:color];
    [self.bottomRightBar setBackgroundColor:color];
    [self.bottomLeftBar setBackgroundColor:color];
    [self.bottomBar setBackgroundColor:color];
}

-(void)prepare{
    [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

-(void)hideBars{
    [self.topBar setHidden:true];
    [self.topLeftBar setHidden:true];
    [self.topRightBar setHidden:true];
    [self.middleBar setHidden:true];
    [self.bottomLeftBar setHidden:true];
    [self.bottomRightBar setHidden:true];
    [self.bottomBar setHidden: true];
    
}

-(void)numZero{
    [self numEight];
    [self.middleBar setHidden:true];
}

-(void)numOne{
    [self hideBars];
    [self.topRightBar setHidden:false];
    [self.bottomRightBar setHidden:false];
}

-(void)numTwo{
    [self hideBars];
    [self.topBar setHidden:false];
    [self.topRightBar setHidden:false];
    [self.middleBar setHidden:false];
    [self.bottomLeftBar setHidden:false];
    [self.bottomBar setHidden:false];
    
}

-(void)numThree{
    [self numOne];
    [self.topBar setHidden:false];
    [self.middleBar setHidden:false];
    [self.bottomBar setHidden:false];
    
}

-(void)numFour{
    [self numOne];
    [self.topLeftBar setHidden:false];
    [self.middleBar setHidden:false];
    
}

-(void)numFive{
    [self hideBars];
    [self.topBar setHidden:false];
    [self.topLeftBar setHidden:false];
    [self.middleBar setHidden:false];
    [self.bottomRightBar setHidden:false];
    [self.bottomBar setHidden:false];
    
}

-(void)numSix{
    [self numEight];
    [self.topRightBar setHidden:true];
    
}

-(void)numSeven{
    [self numOne];
    [self.topBar setHidden:false];
    
}

-(void)numEight{
    
    [self.topBar setHidden:false];
    [self.topLeftBar setHidden:false];
    [self.topRightBar setHidden:false];
    [self.middleBar setHidden:false];
    [self.bottomLeftBar setHidden:false];
    [self.bottomRightBar setHidden:false];
    [self.bottomLeftBar setHidden:false];
    [self.bottomBar setHidden:false];
    
}

-(void)numNine{
    [self numEight];
    [self.bottomBar setHidden:true];
    [self.bottomLeftBar setHidden:true];
    
}

@end
