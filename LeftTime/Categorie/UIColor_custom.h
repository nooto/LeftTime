//
//  UIColor_custom.h
//  LeftTime
//
//  Created by GaoAng on 15/5/6.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (UIColor_custom)

+ (UIColor *) colorFromColorString:(NSString *)colorString;
+ (UIColor *)colorFromColorString:(NSString *)colorString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
@end
