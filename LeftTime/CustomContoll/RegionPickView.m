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

@property (nonatomic, strong) NSArray *mSourceData;
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

-(NSArray*)mSourceData{
    if (!_mSourceData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"lifeTime.plist" ofType:nil];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        _mSourceData = [NSArray arrayWithArray:[arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSDictionary *dict1= nil;
            NSDictionary *dict2=nil;
            if ([obj1 isKindOfClass:[NSDictionary class]]) {
                dict1 = (NSDictionary*)obj1;
            }
            if ([obj2 isKindOfClass:[NSDictionary class]]) {
                dict2 = (NSDictionary*)obj2;
            }
//            return [a integerValue] > [b integerValue];

            return [dict1[@"人均"] floatValue] < [dict2[@"人均"] floatValue];
        }]];
//        NSDictionary *sourceData = [NSDictionary dictionaryWithContentsOfFile:path];
//        [sourceData enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            NSDictionary *dict1= nil;
//            NSDictionary *dict2=nil;
//            if ([obj1 isKindOfClass:[NSDictionary class]]) {
//                dict1 = (NSDictionary*)obj1;
//            }
//            if ([obj2 isKindOfClass:[NSDictionary class]]) {
//                dict2 = (NSDictionary*)obj2;
//            }
//            return [obj1[@"人均"] compare:obj2[@"人均"]];
//        }];
//        
//        _mSourceData =  [NSArray arrayWithArray:[sourceData keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//            NSDictionary *dict1= nil;
//            NSDictionary *dict2=nil;
//            if ([obj1 isKindOfClass:[NSDictionary class]]) {
//                dict1 = (NSDictionary*)obj1;
//            }
//            if ([obj2 isKindOfClass:[NSDictionary class]]) {
//                dict2 = (NSDictionary*)obj2;
//            }
//            return [obj1[@"人均"] compare:obj2[@"人均"]];
//        }]];
    }
    
    return _mSourceData;
}
-(void)leftButtonAction{
    [self showPickerView:NO];
}
-(void)rightButtonAction{
    [self showPickerView:NO];
}

-(void)showPickerView:(BOOL)show {
}

-(void)showPickerView:(BOOL)show WithDate:(NSString *)date{
    [self showPickerView:show];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 55.0f;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.mSourceData.count;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSDictionary *dict = [self.mSourceData objectAtIndex:row];
    return dict[@"地区"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.m_delegate && [self.m_delegate respondsToSelector:@selector(pickerView:SelectDate:)]) {
        NSDictionary *dict = [self.mSourceData objectAtIndex:row];
        [self.m_delegate pickerView:self SelectDate:dict];
    }
}

@end