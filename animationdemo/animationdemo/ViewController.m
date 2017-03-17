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

#import "flashanimationview.h"

#import "AFFNumericKeyboard.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AFFNumericKeyboardDelegate>

@property(nonatomic,copy)NSArray *titlearray;

@property(nonatomic,strong)UITableView *contentableview;

@property(nonatomic,strong)UITextField *textUItextFiled;

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
    
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    flashanimationview *flashview = [[flashanimationview alloc] initWithFrame:CGRectMake(40, 60, 100, 100)];
    [header addSubview:flashview];
    
    [flashview beginanimation];
    header.backgroundColor = [UIColor lightGrayColor];
    
    
    UITextField *uitextfied = [[UITextField alloc] initWithFrame:CGRectMake(40, 160, 200, 30)];
    
    uitextfied.layer.borderWidth = 2.f;
    uitextfied.layer.borderColor = [UIColor lightGrayColor].CGColor;
    uitextfied.textColor = [UIColor whiteColor];
    
    AFFNumericKeyboard *keyboard = [[AFFNumericKeyboard alloc] initWithFrame:CGRectMake(0, 200, 375, 216)];
    keyboard.delegate = self;
    _textUItextFiled = uitextfied;
    uitextfied.inputView = keyboard;
    [header addSubview:uitextfied];
    
    
    _contentableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _contentableview.delegate = self;
    _contentableview.dataSource = self;
    
    [self.view addSubview:_contentableview];
    
    _contentableview.tableHeaderView = header;
    
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



- (void) numberKeyboardInput:(NSInteger) number{

    @autoreleasepool {
        
        NSString *temperstr = _textUItextFiled.text;
    
        NSString *newstr = [NSString stringWithFormat:@"%@%ld",temperstr,(long)number];
    
        if (newstr.length > 10) {
            return;
        }else{
            _textUItextFiled.text = newstr;
        }
    }
    
}
- (void) numberKeyboardBackspace{
    
}
- (void) changeKeyboardType{
    
}
- (void) longPressDelete{
    
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
