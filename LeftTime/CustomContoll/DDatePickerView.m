//
//  DDatePickerView.m
//  DCalendar
//
//  Created by GaoAng on 14-5-24.
//  Copyright (c) 2014å¹´ richinfo.cn. All rights reserved.
//

#import "DDatePickerView.h"
#import "Macro.h"

@interface DDatePickerView(){
    
}
@property(nonatomic, strong) UILabel *chineseStr;
@end

@implementation DDatePickerView
@synthesize isShow, mCurDate;
@synthesize m_delegate;
@synthesize chineseStr;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        
        chineseStr = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
        [chineseStr setTextAlignment:NSTextAlignmentLeft];
        [chineseStr setTextColor:[UIColor whiteColor]];
        [chineseStr setFont:[UIFont systemFontOfSize:16]];
        [chineseStr setBackgroundColor:Color_orange_F866822];
//        [self addSubview:chineseStr];
        
        mCurDate = [NSDate date];
        mDatePikcer = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, frame.size.height)];
        [mDatePikcer setFrame:self.bounds];
        mDatePikcer.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        mDatePikcer.datePickerMode = UIDatePickerModeDate;

        [mDatePikcer setDate:[NSDate date]];
        [self setChineseStrWithDate:mDatePikcer.date];
        [self addSubview:mDatePikcer];
        
        [mDatePikcer addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    }
    return self;
}
-(void)setDatePickerMode:(UIDatePickerMode)model{
    if (model >= UIDatePickerModeTime && model <= UIDatePickerModeCountDownTimer) {
        mDatePikcer.datePickerMode = model;
    }
    else{
        mDatePikcer.datePickerMode = UIDatePickerModeDateAndTime;
    }
    [mDatePikcer setMinuteInterval:5];
}

-(void)leftButtonAction{
    if (m_delegate && [m_delegate respondsToSelector:@selector(datePickerView:SelectDate:)]) {
        [m_delegate datePickerView:self SelectDate:nil];
    }
    [self showDatePickerView:NO];
}
-(void)rightButtonAction{
    [self showDatePickerView:NO];
    if (m_delegate && [m_delegate respondsToSelector:@selector(datePickerView:SelectDate:)]) {
        [m_delegate datePickerView:self SelectDate:mCurDate];
    }
}


-(void)setMinDate:(NSTimeInterval)minTime{
    [mDatePikcer setMinuteInterval:5];
    
    if (minTime <= 0) {
        [mDatePikcer setMinimumDate:[NSDate date]];
        return;
    }
    mDatePikcer.minimumDate = [NSDate dateWithTimeIntervalSince1970:minTime];
}
-(void)setMaxDate:(NSTimeInterval)minTime{
    [mDatePikcer setMinuteInterval:5];
    if (minTime <= 0) {
        [mDatePikcer setMaximumDate:nil];
        return;
    }
    mDatePikcer.maximumDate = [NSDate dateWithTimeIntervalSince1970:minTime];
}

-(void)setMinimumDate:(NSDate *)date{
    mDatePikcer.minimumDate = date;
}

-(void)setMaximumDate:(NSDate *)date{
    mDatePikcer.maximumDate = date;
}

-(void)showDatePickerView:(BOOL)show WithTimeInterval:(NSTimeInterval)timeIntval{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeIntval];
    [self showDatePickerView:show WithDate:date];
}

-(void)showDatePickerView:(BOOL)show WithDate:(NSDate*)date{
    if (date) {
        mCurDate = date;
        [self setChineseStrWithDate:mCurDate];
        [mDatePikcer setDate:mCurDate];
    }
    [self showDatePickerView:show];
}


-(void)setDatePickerViewDate:(NSDate*)Date{
    mCurDate = Date;
    [self setChineseStrWithDate:mCurDate];
    [mDatePikcer setDate:mCurDate animated:YES];
    
}
-(void)setDatePickerViewWithTimeInterval:(NSTimeInterval)timeIntval{
    if (timeIntval <= 0) {
        return;
    }
    mCurDate = [NSDate dateWithTimeIntervalSince1970:timeIntval];
    [self setChineseStrWithDate:mCurDate];
    [mDatePikcer setDate:mCurDate animated:YES];
}

-(void)setChineseStrWithDate:(NSDate*)date{
//    [chineseStr setText:[NSString stringWithFormat:@"    选择日期: 农历 %@",[Utility getChineseCalendarWithDate:date]]];
}

-(void)dateChanged:(id)sender{
    mCurDate = mDatePikcer.date;
//    [chineseStr setText:[NSString stringWithFormat:@"    选择日期: 农历 %@",[Utility getChineseCalendarWithDate:mCurDate]]];
    if (m_delegate && [m_delegate respondsToSelector:@selector(datePickerView:SelectDate:)]) {
        [m_delegate datePickerView:self SelectDate:mCurDate];
    }
}

-(void)showDatePickerView:(BOOL)show {
//    isShow = show;
//    if (m_delegate && [m_delegate respondsToSelector:@selector(datePickerView:willShow:)]) {
//        [m_delegate datePickerView:self willShow:show];
//    }
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

@end