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

@interface TimeView()
@property (nonatomic, assign) UILabel *mLabel;
@end
@implementation TimeView
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor greenColor]];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 35)];
        [textLabel setText:@"时间"];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.center = CGPointMake(self.center.x, CGRectGetHeight(frame)/2);
        [textLabel setTextColor:[UIColor blackColor]];
        [self addSubview:textLabel];
        self.mLabel = textLabel;
    }
    return self;
}

- (void)setLabelText:(NSString*)text{
    [self.mLabel setText:text];
}

@end
