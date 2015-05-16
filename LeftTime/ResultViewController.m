//
//  ResultViewController.m
//  LeftTime
//
//  Created by GaoAng on 15/5/5.
//  Copyright (c) 2015年 GaoAng. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *mCollectionView;
@property (nonatomic, assign) CGFloat  cellWidth;
@end

@implementation ResultViewController

-(UICollectionView*)mCollectionView{
    if (!_mCollectionView) {
        UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc] init];
        _mCollectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [_mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _mCollectionView.backgroundColor=[UIColor whiteColor];
        _mCollectionView.delegate=self;
        _mCollectionView.dataSource=self;
    }
    return _mCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mCollectionView];
    [self.mCollectionView setBackgroundColor:[UIColor yellowColor]];
    [self.mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"DeviceCell"];
    // Do any additional setup after loading the view.
    self.cellWidth =  (SCREEN_W - 50 )/ 12 - 10;
    self.cellWidth = SCREEN_W / 12 ;
    
    
    UIButton *addButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, SCREEN_W, 60)];
    addButton3.layer.borderColor = Color_deepGray_666666.CGColor;
    addButton3.layer.borderWidth = 0.5f;
    addButton3.layer.cornerRadius = 4.0f;
    [addButton3 setTitle:@"日志" forState:UIControlStateNormal];
    [addButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton3 addTarget:self action:@selector(logButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton3];
}
-(void)logButton{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backButtonAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 72;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeviceCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((60 * indexPath.row) / 255.0) green:((40 * indexPath.row)/255.0) blue:((90 * indexPath.row)/255.0) alpha:1.0f];
    cell.layer.cornerRadius = 5.0f;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.cellWidth, self.cellWidth);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(10, 10);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld %ld",(long)indexPath.section,(long)indexPath.row);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
