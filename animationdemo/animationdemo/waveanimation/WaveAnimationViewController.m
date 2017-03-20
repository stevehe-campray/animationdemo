//
//  WaveAnimationViewController.m
//  animationdemo
//
//  Created by hejingjin on 17/3/17.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "WaveAnimationViewController.h"
#import "WaveView.h"
@interface WaveAnimationViewController ()
@property(nonatomic,strong)WaveView *waveview;

@end

@implementation WaveAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setUpMainInterface];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setUpMainInterface{
    WaveView *waveview = [[WaveView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 60)];
    
    waveview.speed = 3.f;
    waveview.height = 40;
    _waveview = waveview;
    [self.view addSubview:waveview];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_waveview startanimation];
    
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
