//
//  ColonView.m
//  DigitalClock
//
//  Created by Qasim Abbas on 5/29/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import "ColonView.h"

@implementation ColonView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

-(void) prepare{
    
    [[NSBundle mainBundle] loadNibNamed:@"Colon" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

-(void)setColor:(UIColor*)color{
    [_topView setBackgroundColor:color];
    [_bottomView setBackgroundColor:color];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
