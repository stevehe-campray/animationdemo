//
//  HJJTransitionsAnimation.h
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum : NSUInteger{
    
    animate_push = 0,
    animate_pop = 1,
} Animate_Type;

@interface HJJTransitionsAnimation : NSObject <UIViewControllerAnimatedTransitioning>


-(instancetype)initWithAnimateType:(Animate_Type)type Duration:(CGFloat)duration;

@property(assign , nonatomic)CGFloat duration;

@property(assign , nonatomic)Animate_Type type;



@end
