//
//  UIViewController+HJJTransitions.m
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "UIViewController+HJJTransitions.h"
#import <objc/runtime.h>

@implementation UIViewController (HJJTransitions)


- (CGFloat)hjj_targetHeight{
    
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setHjj_targetHeight:(CGFloat)hjj_targetHeight{
    
    objc_setAssociatedObject(self, @selector(hjj_targetHeight), @(hjj_targetHeight), OBJC_ASSOCIATION_RETAIN);
}

- (void)setHjj_targetView:(UIView *)hjj_targetView{
    
    objc_setAssociatedObject(self, @selector(hjj_targetView), hjj_targetView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)hjj_targetView{
    return objc_getAssociatedObject(self, _cmd);
}


@end
