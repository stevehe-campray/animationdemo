//
//  HJJTransitionsAnimation.m
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "HJJTransitionsAnimation.h"
#import "UIViewController+HJJTransitions.h"

#define k_SF_SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define k_SF_SCREEN_HIGHT                        [UIScreen mainScreen].bounds.size.height
@implementation HJJTransitionsAnimation{
    UIView *custemview;
}


-(instancetype)init{
    return  [self initWithAnimateType:animate_push Duration:1.5f];
}

-(instancetype)initWithAnimateType:(Animate_Type)type Duration:(CGFloat)duration{
    self = [super init];
    if (self) {
        _type = type;
        _duration = duration;
    }
    return self;
}


//转场动画执行时间
-(CGFloat)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return _duration;
    
}

//做转场动画
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    
    if (_type == animate_push) {
        
        //类别是push执行push转场动画
        
        [self PushTransitionAnimationWtihTransitionContext:transitionContext];
        
    }else{
        //执行pop动画
        
        [self PopTransitionAnimationWtihTransitionContext:transitionContext];
        
    }
    
}

//    1.transitionContext为需要做动画的上下文 从上下文容器中获取从A控制器到B控制器



//动画拆分为push和pop 分开做动画
- (void)PushTransitionAnimationWtihTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
//    1.A push To B
//    UITransitionContextFromViewControllerKey 获取A控制器的key
//    UITransitionContextToViewControllerKey  获取B控制器的key

    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    //起始位置
    CGRect originFrame = [fromVc.hjj_targetView convertRect:fromVc.hjj_targetView.bounds toView:fromVc.view];
    
    //终点位置
    CGRect flishFrame = [toVc.hjj_targetView convertRect:toVc.hjj_targetView.bounds toView:toVc.view];
    
    CGFloat height = CGRectGetMidY(flishFrame);
    toVc.hjj_targetHeight = height;
    //创建移动时候的镜像
    UIView *custemviews = [self customSnapshoFromView:fromVc.hjj_targetView];
    custemviews.frame = originFrame;
    
    
    //动画时候的容器
    UIView *cotaineview = [transitionContext containerView];
    
    //背景视图 灰色
    UIView *backgray = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_SF_SCREEN_WIDTH, k_SF_SCREEN_HIGHT)];
    backgray.backgroundColor = [UIColor lightGrayColor];
    //背景视图  白色
    UIView *backwhite = [[UIView alloc] initWithFrame:CGRectMake(0, height, k_SF_SCREEN_HIGHT, k_SF_SCREEN_HIGHT-height)];
    backwhite.backgroundColor = [UIColor whiteColor];
    
    
    
    toVc.view.frame = [transitionContext finalFrameForViewController:toVc];
    
    
    [cotaineview addSubview:toVc.view];
//    [cotaineview addSubview:fromVc.view];
    [cotaineview addSubview:backgray];
    [backgray addSubview:backwhite];
    [cotaineview addSubview:custemviews];
    
    
    [UIView animateWithDuration:_duration/3 animations:^{
        custemviews.frame = flishFrame;
        custemviews.transform = CGAffineTransformMakeScale(1.1,1.1);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:_duration/3 animations:^{
            
            custemviews.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
            if (finished) {

            [UIView animateWithDuration:_duration/3 animations:^{
                custemviews.alpha = 0.0;
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [backgray removeFromSuperview];
                    [custemviews removeFromSuperview];
                    [transitionContext completeTransition:YES];
                }
            }];
            
            [self addPathAnimateWithView:backgray fromPoint:custemviews.center];
                
            }
        }];
        
       
    }];
    
    
    
}

//Pop动画
-(void)PopTransitionAnimationWtihTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
 
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    //起始位置
    CGRect originFrame = [fromVc.hjj_targetView convertRect:fromVc.hjj_targetView.bounds toView:fromVc.view];
    
    //终点位置
    CGRect flishFrame = [toVc.hjj_targetView convertRect:toVc.hjj_targetView.bounds toView:toVc.view];
    
    CGFloat height = CGRectGetMidY(originFrame);
    toVc.hjj_targetHeight = height;
    //创建移动时候的镜像
    UIView *custemviews = [self customSnapshoFromView:fromVc.hjj_targetView];
    custemviews.frame = originFrame;
    
    
    //动画时候的容器
    UIView *cotaineview = [transitionContext containerView];
    
    //背景视图 灰色
    UIView *backgray = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_SF_SCREEN_WIDTH, k_SF_SCREEN_HIGHT)];
    backgray.backgroundColor = [UIColor lightGrayColor];
    //背景视图  白色
    UIView *backwhite = [[UIView alloc] initWithFrame:CGRectMake(0, height, k_SF_SCREEN_HIGHT, k_SF_SCREEN_HIGHT-height)];
    backwhite.backgroundColor = [UIColor whiteColor];
    
    
    
    toVc.view.frame = [transitionContext finalFrameForViewController:toVc];
    
    
    [cotaineview addSubview:toVc.view];
    [cotaineview addSubview:fromVc.view];
    [cotaineview addSubview:backgray];
    [backgray addSubview:backwhite];
    [cotaineview addSubview:custemviews];
    
    [self addPathAnimateWithView:backgray fromPoint:custemviews.center];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_duration/3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:_duration/3 animations:^{
            custemviews.frame = flishFrame;
            custemviews.transform = CGAffineTransformMakeScale(1.1,1.1);
        } completion:^(BOOL finished) {
            
            [fromVc.view removeFromSuperview];
            
            
            [UIView animateWithDuration:_duration/3 animations:^{
                backgray.alpha = 0.0;
                custemviews.transform = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [backgray removeFromSuperview];
                    [custemviews removeFromSuperview];
                    [transitionContext completeTransition:YES];
                }
            }];
            
            
        }];
    });
    
   
}


//产生移动过程targetView镜像
- (UIView *)customSnapshoFromView:(UIView *)inputView {
    
    // Make an image from the input view.
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Create an image view.
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}


//扩张动画
//加入收合动画
- (void)addPathAnimateWithView:(UIView *)toView fromPoint:(CGPoint)point{
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, k_SF_SCREEN_WIDTH, k_SF_SCREEN_HIGHT)];
    //create path
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:point radius:0.1 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CGFloat radius = point.y > 0?k_SF_SCREEN_HIGHT*3/4: k_SF_SCREEN_HIGHT*3/4-point.y;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, k_SF_SCREEN_WIDTH, k_SF_SCREEN_HIGHT)];
    [path2 appendPath:[UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //shapeLayer.path = path.CGPath;
    toView.layer.mask = shapeLayer;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = _type == animate_push? (__bridge id)path.CGPath:(__bridge id)path2.CGPath;
    pathAnimation.toValue   = _type == animate_push? (__bridge id)path2.CGPath:(__bridge id)path.CGPath;
    pathAnimation.duration  = _duration/3;
    pathAnimation.repeatCount = 1;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [shapeLayer addAnimation:pathAnimation forKey:@"pathAnimate"];
    
}

@end
