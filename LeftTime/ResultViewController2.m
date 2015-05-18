//
//  ResultViewController.m
//  ChartJS
//
//  Created by GaoAng on 15/5/18.
//  Copyright (c) 2015年 Touchware. All rights reserved.
//

#import "ResultViewController2.h"
#import "TWRChartView.h"
#import "TWRCircularChart.h"

@interface ResultViewController2 ()
@property(strong, nonatomic) TWRChartView *chartView;
@property (nonatomic, strong) NSMutableArray *mValuse;
@end

@implementation ResultViewController2

-(NSMutableArray*)mValuse{
    if (!_mValuse) {
        _mValuse = [[NSMutableArray alloc] initWithCapacity:2];
    }
    return _mValuse;
}

-(TWRChartView*)chartView{
    if (!_chartView) {
        _chartView = [[TWRChartView alloc] initWithFrame:self.view.bounds];
    }
    return _chartView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.chartView];
    
    // Values
    //    NSArray *values = @[@20, @30, @15, @5];
//    NSArray *values = @[@70, @(30)];
    
    // Colors
    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
    color1 = [UIColor grayColor];
    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.6 brightness:0.6 alpha:1.0];
    color2 = [UIColor blackColor];
//    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.6 brightness:0.6 alpha:1.0];
//    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.6 brightness:0.6 alpha:1.0];
    //    NSArray *colors = @[color1, color2, color3, color4];
    NSArray *colors = @[color1,color2];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:self.mValuse
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart withCompletionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"Animation finished!!!");
        }
    }];
    
}

-(void)setChartViewValue:(NSDate *)datas allTime:(CGFloat)allTime{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *componentt = [[NSDateComponents alloc] init];
    componentt = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:datas toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    CGFloat month = componentt.month +componentt.year * 12 + componentt.day % 31;
    CGFloat allMonth = allTime * 12;
    self.mValuse = [NSMutableArray arrayWithObjects:@(allMonth - month), @(allMonth ), nil];
//    CGFloat leftMonth = (100 * month ) / allTime;
//    self.mValuse =  [NSMutableArray arrayWithArray:@[@(leftMonth),@(100-leftMonth)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
