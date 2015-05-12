//
//  TimeView.m
//  LeftTime
//
//  Created by GaoAng on 15/5/12.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import "TimeView.h"
#import "CategorieHelper.h"
#import "Macro.h"

@implementation TimeView
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor grayColor]];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 35)];
        [textLabel setText:@"时间"];
        [textLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:textLabel];
    }
    return self;
}

@end
