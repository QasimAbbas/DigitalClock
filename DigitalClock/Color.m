//
//  Color.m
//  DigitalClock
//
//  Created by Qasim Abbas on 5/31/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import "Color.h"

@implementation Color

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIColor *)red{
    return UIColorFromRGB(0xFE0000);
}
+(UIColor *)green{
    return UIColorFromRGB(0x7F53E);
}
+(UIColor *)purple{
    return UIColorFromRGB(0x437EF3);
}
+(UIColor *)darkGreen{
    return UIColorFromRGB(0x359B5D);
}


@end
