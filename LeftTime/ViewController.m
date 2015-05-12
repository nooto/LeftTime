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

@interface ViewController ()

//@property (nonatomic, strong) DDatePickerView *mDatePickerView;
//@property (nonatomic, strong) RegionPickView *mRegionPickView;


@property (nonatomic, strong)  TimeView   *mTimeView;
@property (nonatomic, strong)  RegionView *mRegionView;
@property (nonatomic, strong)  ResultView *mResultView;
@end

@implementation ViewController

-(TimeView*)mTimeView{
    if (!_mTimeView) {
        _mTimeView = [[TimeView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, (SCREEN_H - 64)/3)];
        [_mTimeView addTarget:self action:@selector(showTimePickerView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mTimeView;
}

-(RegionView*)mRegionView{
    if (!_mRegionView) {
        _mRegionView = [[RegionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mTimeView.frame), SCREEN_W, CGRectGetHeight(_mTimeView.frame))];
    }
    return _mRegionView;
}

-(ResultView*)mResultView{
    if (!_mResultView) {
        _mResultView = [[ResultView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mRegionView.frame), SCREEN_W, CGRectGetHeight(_mRegionView.frame))];
    }
    return _mResultView;
}


//-(DDatePickerView*)mDatePickerView{
//    if (!_mDatePickerView) {
//        _mDatePickerView = [[DDatePickerView alloc] initWithFrame:CGRectMake(0, SCREEN_H, 0, 0)];
//        [_mDatePickerView showDatePickerView:NO];
//    }
//    return _mDatePickerView;
//}
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
//-(RegionPickView*)mRegionPickView{
//    if (!_mRegionPickView) {
//        _mRegionPickView = [[RegionPickView alloc] initWithFrame:CGRectMake(0, SCREEN_H, SCREEN_W, 0)];
//    }
//    return _mRegionPickView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"how time fly!"];
    [self.view addSubview:self.mTimeView];
    [self.view addSubview:self.mRegionView];
    [self.view addSubview:self.mResultView];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:self.mDatePickerView];
//    [self.view addSubview:self.mRegionPickView];
}

-(void)showTimePickerView{
    CGFloat moveGap  = CGRectGetHeight(_mTimeView.frame)/2;
    [UIView animateWithDuration:0.3f animations:^{
        [_mTimeView setFrame:CGRectMake(0, 64 - moveGap, CGRectGetWidth(_mTimeView.frame), CGRectGetHeight(_mTimeView.frame))];
        [_mRegionView setFrame:CGRectMake(0, CGRectGetMinY(_mRegionView.frame) + moveGap, CGRectGetWidth(_mRegionView.frame), CGRectGetHeight(_mRegionView.frame))];
        [_mResultView setFrame:CGRectMake(0, CGRectGetMinY(_mResultView.frame) + moveGap, CGRectGetWidth(_mResultView.frame), CGRectGetHeight(_mResultView.frame))];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(IBAction)resuletButtonAction:(id)sender{
//    [self.mRegionPickView showPickerView:NO];
//    [self.mDatePickerView showDatePickerView:NO];
//}
//
//-(IBAction)datePickViewAction:(id)sender{
//    [self.mRegionPickView showPickerView:NO];
//    [self.mDatePickerView showDatePickerView:!self.mDatePickerView.isShow];
//}
//
//-(IBAction)regionPickViewAction:(id)sender{
//    [self.mDatePickerView showDatePickerView:NO];
//    [self.mRegionPickView showPickerView:!self.mRegionPickView.isShow];
//}
@end
