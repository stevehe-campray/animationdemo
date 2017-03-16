//
//  FistViewController.m
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "FistViewController.h"
#import "SeccendViewController.h"
#import "FirstCell.h"
#import "UIViewController+HJJTransitions.h"
#import "HJJTransitionsAnimation.h"

#define SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HIGHT                        [UIScreen mainScreen].bounds.size.height

@interface FistViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property (strong, nonatomic) HJJTransitionsAnimation    *animate;

@end

@implementation FistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(SCREEN_WIDTH/3-20, (SCREEN_WIDTH/3-20)*1.3)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumInteritemSpacing:20];
    [layout setMinimumLineSpacing:20];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate        = self;
    _collectionView.dataSource      = self;
    [_collectionView registerClass:[FirstCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:_collectionView];
    
    self.animate = [[HJJTransitionsAnimation alloc] init];
    
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.animate;
    }else{
        
        return nil;
    }
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    cell.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCell *cell = (FirstCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.hjj_targetView = cell;
    SeccendViewController *seccendvc = [[SeccendViewController alloc] init];
    seccendvc.v_coler = cell.backgroundColor;
    [self.navigationController pushViewController:seccendvc animated:YES];
    
}




//- (UICollectionView *)collectionView{
//    
//    NSLog(@"11111");
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        [layout setItemSize:CGSizeMake(SCREEN_WIDTH/3-20, (SCREEN_WIDTH/3-20)*1.3)];
//        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
//        [layout setMinimumInteritemSpacing:20];
//        [layout setMinimumLineSpacing:20];
//        
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT) collectionViewLayout:layout];
//        _collectionView.backgroundColor = [UIColor whiteColor];
//        _collectionView.delegate        = self;
//        _collectionView.dataSource      = self;
//        [_collectionView registerClass:[FirstCell class] forCellWithReuseIdentifier:@"cell"];
//        
//    }
//    return _collectionView;
//}




@end
