//
//  SeccendViewController.m
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "SeccendViewController.h"
#import "HJJTransitionsAnimation.h"
#import "UIViewController+HJJTransitions.h"
#define SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HIGHT                        [UIScreen mainScreen].bounds.size.height

@interface SeccendViewController ()<UINavigationControllerDelegate>
@property (strong, nonatomic) HJJTransitionsAnimation    *animate;

@end

@implementation SeccendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    self.animate = [[HJJTransitionsAnimation alloc] initWithAnimateType:animate_pop Duration:1.5f];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //转场动画获终点位置
    UIView *image = [[UIView alloc] initWithFrame:CGRectMake(20, SCREEN_HIGHT/2-64-70, SCREEN_WIDTH/3-20, (SCREEN_WIDTH/3-20)*1.3)];
    image.backgroundColor = self.v_coler;
    self.hjj_targetView = image;
//    self.hjj_targetView.hidden = YES;
    
    [self.view addSubview:image];
 
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//     self.navigationController.delegate = self;
}

- (void)setV_coler:(UIColor *)v_coler{
    _v_coler = v_coler;
//    _targetView.backgroundColor = _v_coler;
}



- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        return self.animate;
    }else{
        return nil;
    }
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
