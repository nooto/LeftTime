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

@property (nonatomic, strong) DDatePickerView *mDatePickerView;
@property (nonatomic, strong) RegionPickView *mRegionPickView;
@property (nonatomic, strong)  UIButton *mTimeButton;
@property (nonatomic, strong)  UIButton *mRegionButton;
@end

@implementation ViewController


-(DDatePickerView*)mDatePickerView{
    if (!_mDatePickerView) {
        _mDatePickerView = [[DDatePickerView alloc] initWithFrame:CGRectMake(0, SCREEN_H, 0, 0)];
        [_mDatePickerView showDatePickerView:NO];
    }
    return _mDatePickerView;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touchu = [touches anyObject];
    CGPoint point =[touchu locationInView:self.view];
    if (!CGRectContainsPoint(self.mTimeButton.frame, point)) {
        [self.mDatePickerView showDatePickerView:NO];
    }
    
    if (!CGRectContainsPoint(self.mRegionButton.frame, point)) {
        [self.mRegionPickView showPickerView:NO];
    }
}

-(RegionPickView*)mRegionPickView{
    if (!_mRegionPickView) {
        _mRegionPickView = [[RegionPickView alloc] initWithFrame:CGRectMake(0, SCREEN_H, SCREEN_W, 0)];
    }
    return _mRegionPickView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"how time fly!"];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:self.mDatePickerView];
//    [self.view addSubview:self.mRegionPickView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)resuletButtonAction:(id)sender{
    [self.mRegionPickView showPickerView:NO];
    [self.mDatePickerView showDatePickerView:NO];
}

-(IBAction)datePickViewAction:(id)sender{
    [self.mRegionPickView showPickerView:NO];
    [self.mDatePickerView showDatePickerView:!self.mDatePickerView.isShow];
}

-(IBAction)regionPickViewAction:(id)sender{
    [self.mDatePickerView showDatePickerView:NO];
    [self.mRegionPickView showPickerView:!self.mRegionPickView.isShow];
}
@end
