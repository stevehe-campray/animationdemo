//
//  flashanimationViewController.m
//  animationdemo
//
//  Created by hejingjin on 17/3/15.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "flashanimationViewController.h"

@interface flashanimationViewController ()

@property(nonatomic,copy)NSArray *titlearray;

@property(nonatomic,strong)UITableView *contentableview;

@end

@implementation flashanimationViewController

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
    

    UIButton *backbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 60, 60)];
    
    [backbutton setTitle:@"返回" forState:UIControlStateNormal];
    [backbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [backbutton addTarget:self action:@selector(buttonpressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:backbutton];
    
    
}


-(void)buttonpressed:(UIButton *)sender{
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"22222");
    }];
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
