//
//  Color.h
//  DigitalClock
//
//  Created by Qasim Abbas on 5/31/18.
//  Copyright © 2018 Qasim Abbas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Color : UIView

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

+(UIColor *)red;
+(UIColor *)green;
+(UIColor *)purple;
+(UIColor *)darkGreen;




@end
