//
//  RegionPickView.m
//  LeftTime
//
//  Created by GaoAng on 15/5/6.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import "RegionPickView.h"
#import "Macro.h"

@interface RegionPickView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic, strong) UIPickerView *mPikcer;
@property(nonatomic, strong) UILabel *bgLabel;
@property(nonatomic, strong) UILabel *chineseStr;
@end

@implementation RegionPickView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
//        self.isShow = NO;
        
//        UILabel *chineseStr = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
//        [chineseStr setTextAlignment:NSTextAlignmentLeft];
//        [chineseStr setTextColor:[UIColor whiteColor]];
//        [chineseStr setFont:[UIFont systemFontOfSize:16]];
//        [chineseStr setBackgroundColor:Color_orange_F866822];
//        [self addSubview:chineseStr];
//        self.chineseStr = chineseStr;
//        
        UIPickerView *mPikcer = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_W, frame.size.height - 44)];
        [mPikcer setFrame:self.bounds];
        mPikcer.dataSource = self;
        mPikcer.delegate = self;
        [self addSubview:mPikcer];
        self.mPikcer = mPikcer;
    }
    return self;
}
-(void)leftButtonAction{
    [self showPickerView:NO];
}
-(void)rightButtonAction{
    [self showPickerView:NO];
}

-(void)showPickerView:(BOOL)show {
//    _isShow = show;
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.3];
//    if (show) {
//        [self setFrame:CGRectMake(0, SCREEN_H - 246, SCREEN_W, 246)];
//    }
//    else{
//        [self setFrame:CGRectMake(0, SCREEN_H, SCREEN_W, 246)];
//    }
//    
//    [UIView commitAnimations];
}
-(void)showPickerView:(BOOL)show WithDate:(NSString *)date{
    [self showPickerView:show];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 55.0f;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 32;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return @"哈哈";
}


@end