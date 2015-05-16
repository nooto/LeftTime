//
//  RegionPickView.h
//  LeftTime
//
//  Created by GaoAng on 15/5/6.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RegionPickView;
@protocol RegionPickViewDelegate <NSObject>

- (void)pickerView:(RegionPickView *)pickerVeiw SelectDate:(NSDictionary*)date;
@optional
- (void)pickerView:(RegionPickView *)pickerView willShow:(BOOL)show;

@end


@interface RegionPickView : UIView

@property (nonatomic, assign) BOOL isShow;
@property(nonatomic, assign) id<RegionPickViewDelegate> m_delegate;

-(void)showPickerView:(BOOL)show;
-(void)showPickerView:(BOOL)show WithDate:(NSString*)date;

@end
