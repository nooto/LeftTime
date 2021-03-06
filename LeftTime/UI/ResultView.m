//
//  ResultView.m
//  LeftTime
//
//  Created by GaoAng on 15/5/12.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import "ResultView.h"
#import "CategorieHelper.h"
#import "Macro.h"

@implementation ResultView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor redColor]];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 35)];
        [textLabel setText:@"结果"];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.center = CGPointMake(self.center.x, CGRectGetHeight(frame)/2);
        [textLabel setTextColor:[UIColor blackColor]];
        [self addSubview:textLabel];
    }
    return self;
}

@end
