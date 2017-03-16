//
//  ViewController.m
//  animationdemo
//
//  Created by hejingjin on 17/3/15.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "ViewController.h"

#import "flashanimationViewController.h"
#import "FistViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)NSArray *titlearray;

@property(nonatomic,strong)UITableView *contentableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
      _titlearray = @[@"flashanimation"];
    
    
    [self setUpMainInterface];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpMainInterface{
    
    _contentableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height)];
    
    _contentableview.delegate = self;
    _contentableview.dataSource = self;
    
    [self.view addSubview:_contentableview];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titlearray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _titlearray[indexPath.row];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",indexPath.row);
    
    
    FistViewController *fistviewvc = [[FistViewController alloc] init];
    
    [self.navigationController pushViewController:fistviewvc animated:YES];
    
//    flashanimationViewController *flashvc = [[flashanimationViewController alloc] init];
//    
//    [self presentViewController:flashvc animated:YES completion:^{
//        NSLog(@"111");
//    }];
    
}

@end
