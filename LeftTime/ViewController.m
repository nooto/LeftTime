//
//  ViewController.m
//  LeftTime
//
//  Created by GaoAng on 15/5/5.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import "ViewController.h"
#import "CustomContoll/DDatePickerView.h"
#import "CustomContoll/RegionPickView.h"
#import "TimeView.h"
#import "RegionView.h"
#import "ResultView.h"
#import "ResultViewController.h"
#import "ResultViewController2.h"
//#define KDIQU @"地区"
//#define KNAN @"男"
//#define KNV @"女"
//#define KRENJUN @"人均"

typedef enum{
    View_Normal,
    View_Time,
    View_Regoin,
    View_Result,
}EHView_Type;

@interface ViewController ()<DDatePickerViewDelegate, RegionPickViewDelegate>

@property (nonatomic, strong) DDatePickerView *mDatePickerView;
@property (nonatomic, strong) RegionPickView *mRegionPickView;

@property (nonatomic, assign) EHView_Type  mViewType;
@property (nonatomic, strong)  TimeView   *mTimeView;
@property (nonatomic, strong)  RegionView *mRegionView;
@property (nonatomic, strong)  ResultView *mResultView;

@property (nonatomic, copy) NSDictionary *mCurAgeDict;
@end

@implementation ViewController

-(TimeView*)mTimeView{
    if (!_mTimeView) {
        _mTimeView = [[TimeView alloc] initWithFrame:CGRectMake(0, [self navBarHeight], SCREEN_W, [self heigthForView])];
        [_mTimeView addTarget:self action:@selector(showTimePickerView:) forControlEvents:UIControlEventTouchUpInside];
        _mTimeView.tag = View_Time;
    }
    return _mTimeView;
}

-(RegionView*)mRegionView{
    if (!_mRegionView) {
        _mRegionView = [[RegionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mTimeView.frame), SCREEN_W, CGRectGetHeight(_mTimeView.frame))];
        [_mRegionView addTarget:self action:@selector(showTimePickerView:) forControlEvents:UIControlEventTouchUpInside];
        _mRegionView.tag = View_Regoin;
    }
    return _mRegionView;
}

-(ResultView*)mResultView{
    if (!_mResultView) {
        _mResultView = [[ResultView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mRegionView.frame), SCREEN_W, CGRectGetHeight(_mRegionView.frame))];
        [_mResultView addTarget:self action:@selector(showTimePickerView:) forControlEvents:UIControlEventTouchUpInside];
        _mResultView.tag = View_Result;
    }
    return _mResultView;
}

-(NSDictionary*)mCurAgeDict{
    if (!_mCurAgeDict) {
        _mCurAgeDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"全国",KDIQU,@"72.38",KNAN, @"77.37",KNV,@"74.83",KRENJUN, nil];
    }
//    <?xml version="1.0" encoding="UTF-8"?>
//    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
//    <plist version="1.0">
//    <dict>
//    <key>男</key>
//    <real>72.38</real>
//    <key>地区</key>
//    <string>全国</string>
//    <key>女</key>
//    <real>77.37</real>
//    <key>人均</key>
//    <real>74.83</real>
//    </dict>
//    </plist>
//
    return _mCurAgeDict;
}


-(DDatePickerView*)mDatePickerView{
    if (!_mDatePickerView) {
        _mDatePickerView = [[DDatePickerView alloc] initWithFrame:CGRectMake(0, [self heigthForView]/2, SCREEN_W, [self heigthForView])];
        _mDatePickerView.m_delegate = self;
//        [_mDatePickerView showDatePickerView:NO];
    }
    return _mDatePickerView;
}
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touchu = [touches anyObject];
//    CGPoint point =[touchu locationInView:self.view];
//    if (!CGRectContainsPoint(self.mTimeButton.frame, point)) {
//        [self.mDatePickerView showDatePickerView:NO];
//    }
//    
//    if (!CGRectContainsPoint(self.mRegionButton.frame, point)) {
//        [self.mRegionPickView showPickerView:NO];
//    }
//}
//
-(CGFloat)navBarHeight{
    return 0;
}
-(CGFloat)heigthForView{
    return (SCREEN_H - [self navBarHeight])/3;
}

-(RegionPickView*)mRegionPickView{
    if (!_mRegionPickView) {
        _mRegionPickView = [[RegionPickView alloc] initWithFrame:CGRectMake(0, [self heigthForView] / 2 * 3 , SCREEN_W,[self heigthForView])];
        _mRegionPickView.m_delegate = self;
    }
    return _mRegionPickView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"how time fly!"];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setHidden:YES];
    [self.view addSubview:self.mDatePickerView];
    [self.view addSubview:self.mRegionPickView];
    [self.view addSubview:self.mTimeView];
    [self.view addSubview:self.mRegionView];
    [self.view addSubview:self.mResultView];
    self.mTimeView.backgroundColor = self.mRegionView.backgroundColor = self.mResultView.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self resignFirstResponder];
}


-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"begin shark");
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"end shark");
    }
}
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"cancel shark");
    }

}
-(void)showTimePickerView:(UIButton*)sender{
    EHView_Type curType =(EHView_Type) sender.tag;
    CGFloat moveGap  = [self heigthForView]/2;
    CGFloat duration = 0.2f;
    if (curType == self.mViewType) {
        curType = View_Normal;
    }
    if (curType == View_Result) {
        [UIView animateWithDuration:duration animations:^{
            [_mTimeView setFrame:CGRectMake(0,   [self navBarHeight], CGRectGetWidth(_mTimeView.frame), CGRectGetHeight(_mTimeView.frame))];
            [_mRegionView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 2, CGRectGetWidth(_mRegionView.frame), CGRectGetHeight(_mRegionView.frame))];
            [_mResultView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 4, CGRectGetWidth(_mResultView.frame), CGRectGetHeight(_mResultView.frame))];
        } completion:^(BOOL finished) {
            ResultViewController2 *vc = [[ResultViewController2 alloc] init];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            [vc setChartViewValue:date allTime:71.2];
            [self.navigationController pushViewController:vc animated:YES];

//            ResultViewController *vc = [[ResultViewController alloc] init];
//            [self.navigationController pushViewController:vc animated:YES];
//            [self presentViewController:vc animated:YES completion:nil];
        }];
    }
    else if (curType == View_Time) {
        [UIView animateWithDuration:duration animations:^{
            [_mTimeView setFrame:CGRectMake(0, [self navBarHeight] - moveGap, CGRectGetWidth(_mTimeView.frame), CGRectGetHeight(_mTimeView.frame))];
            [_mRegionView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 3, CGRectGetWidth(_mRegionView.frame), CGRectGetHeight(_mRegionView.frame))];
            [_mResultView setFrame:CGRectMake(0, [self navBarHeight] +  moveGap * 5, CGRectGetWidth(_mResultView.frame), CGRectGetHeight(_mResultView.frame))];
        }];
    }
    else if (curType == View_Regoin){
        [UIView animateWithDuration:duration animations:^{
            [_mTimeView setFrame:CGRectMake(0,   [self navBarHeight] - moveGap, CGRectGetWidth(_mTimeView.frame), CGRectGetHeight(_mTimeView.frame))];
            [_mRegionView setFrame:CGRectMake(0, [self navBarHeight] + moveGap, CGRectGetWidth(_mRegionView.frame), CGRectGetHeight(_mRegionView.frame))];
            [_mResultView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 5, CGRectGetWidth(_mResultView.frame), CGRectGetHeight(_mResultView.frame))];
        }];
    }
    else if (curType == View_Normal){
        [UIView animateWithDuration:duration animations:^{
            [_mTimeView setFrame:CGRectMake(0,   [self navBarHeight], CGRectGetWidth(_mTimeView.frame), CGRectGetHeight(_mTimeView.frame))];
            [_mRegionView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 2, CGRectGetWidth(_mRegionView.frame), CGRectGetHeight(_mRegionView.frame))];
            [_mResultView setFrame:CGRectMake(0, [self navBarHeight] + moveGap * 4, CGRectGetWidth(_mResultView.frame), CGRectGetHeight(_mResultView.frame))];
        }];
    }
    self.mViewType = curType;
}


-(void)showResultViewController2{
    ResultViewController2 *vc = [[ResultViewController2 alloc] init];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    [vc setChartViewValue:date allTime:71.2];
    [self.navigationController pushViewController:vc animated:YES];
    

}

-(void)datePickerView:(DDatePickerView *)pickerVeiw SelectDate:(NSDate *)date{
//        self.mTimeView set
}
- (void)pickerView:(RegionPickView *)pickerVeiw SelectDate:(NSDictionary *)date{
    self.mCurAgeDict = date;
    [self.mRegionView setLabelText:date[@"地区"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
