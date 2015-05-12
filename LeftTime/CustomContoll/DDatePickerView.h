//
//  DDatePickerView.h
//  DCalendar
//
//  Created by GaoAng on 14-5-24.
//  Copyright (c) 2014å¹´ richinfo.cn. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DDatePickerView;
@protocol DDatePickerViewDelegate <NSObject>

- (void)datePickerView:(DDatePickerView *)pickerVeiw SelectDate:(NSDate*)date;
@optional
- (void)datePickerView:(DDatePickerView *)pickerView willShow:(BOOL)show;

@end

@interface DDatePickerView : UIView{
    UIDatePicker *mDatePikcer;
    UILabel *bgLabel;
}


@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, retain) NSDate *mCurDate;
@property(nonatomic, assign) id<DDatePickerViewDelegate> m_delegate;

-(void)showDatePickerView:(BOOL)show;
-(void)showDatePickerView:(BOOL)show WithDate:(NSDate*)date;
-(void)showDatePickerView:(BOOL)show WithTimeInterval:(NSTimeInterval)timeIntval;


-(void)setDatePickerViewDate:(NSDate*)Date;
-(void)setDatePickerViewWithTimeInterval:(NSTimeInterval)timeIntval;

-(void)setDatePickerMode:(UIDatePickerMode)model;
-(void)setMinDate:(NSTimeInterval)minTime;
-(void)setMaxDate:(NSTimeInterval)minTime;

-(void)setMinimumDate:(NSDate *)date;
-(void)setMaximumDate:(NSDate *)date;

@end
