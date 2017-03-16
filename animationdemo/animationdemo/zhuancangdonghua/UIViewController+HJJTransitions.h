//
//  UIViewController+HJJTransitions.h
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HJJTransitions)



@property(nonatomic,assign)CGFloat hjj_targetHeight;//需要做动画的view的高度

@property(weak , nonatomic)UIView *hjj_targetView;//需要做动画的view

@end
