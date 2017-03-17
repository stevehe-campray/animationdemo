//
//  flashanimationview.m
//  animationdemo
//
//  Created by hejingjin on 17/3/16.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "flashanimationview.h"



@implementation flashanimationview{
    
    CALayer *_baselayer;
    CAShapeLayer *_cyclelayer1;
    CAShapeLayer *_cyclelayer2;
    CAShapeLayer *_arrawlayer1;
    CAShapeLayer *_arrawlayer2;
    UIBezierPath *_startArrowPath1;
    UIBezierPath *_startArrowPath2;
    UIBezierPath *_endArrowPath1;
    UIBezierPath *_endArrowPath2;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initLayerAndProperty];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initLayerAndProperty];
    }
    return self;
}

-(void)initLayerAndProperty{
    
    self.backgroundColor = [UIColor redColor];
    
    [self setUpLayers];
    
    [self setUpPaths];
    
    
}
//初始化layer
-(void)setUpLayers{
    
    
    
    _cyclelayer1 = [CAShapeLayer layer];
    _cyclelayer1.fillColor = [UIColor clearColor].CGColor;
    _cyclelayer1.strokeColor = [UIColor whiteColor].CGColor;
    _cyclelayer1.lineWidth = 3;
    _cyclelayer1.contentsScale = [UIScreen mainScreen].scale;
    _cyclelayer1.lineCap = kCALineCapRound;
    
    
    _cyclelayer2 = [CAShapeLayer layer];
    _cyclelayer2.fillColor = [UIColor clearColor].CGColor;
    _cyclelayer2.strokeColor = [UIColor whiteColor].CGColor;
    _cyclelayer2.lineWidth = 3;
    _cyclelayer2.contentsScale = [UIScreen mainScreen].scale;
    _cyclelayer2.lineCap = kCALineCapRound;
    
    _arrawlayer1 = [CAShapeLayer layer];
    _arrawlayer1.fillColor = [UIColor clearColor].CGColor;
    _arrawlayer1.strokeColor = [UIColor whiteColor].CGColor;
    _arrawlayer1.lineWidth = 3;
    _arrawlayer1.contentsScale = [UIScreen mainScreen].scale;
    _arrawlayer1.lineCap = kCALineCapRound;
    
    _arrawlayer2 = [CAShapeLayer layer];
    _arrawlayer2.fillColor = [UIColor clearColor].CGColor;
    _arrawlayer2.strokeColor = [UIColor whiteColor].CGColor;
    _arrawlayer2.lineWidth = 3;
    _arrawlayer2.contentsScale = [UIScreen mainScreen].scale;
    _arrawlayer2.lineCap = kCALineCapRound;
    
    
    _baselayer =  [[CALayer alloc] init];
    _baselayer.frame = self.bounds;
    
    
    [_baselayer addSublayer:_cyclelayer1];
    [_baselayer addSublayer:_cyclelayer2];
    [_baselayer addSublayer:_arrawlayer1];
    [_baselayer addSublayer:_arrawlayer2];
    
    [self.layer addSublayer:_baselayer];
    
}

//初始化路径
-(void)setUpPaths{
    
    
    CGFloat radius = self.frame.size.width < self.frame.size.height ? self.frame.size.width /2 - 8: self.frame.size.height/2 - 8;
    
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    UIBezierPath *cyclepatch1 = [UIBezierPath bezierPath];
    [cyclepatch1 addArcWithCenter:CGPointMake(self.frame.size.width/2 , self.frame.size.height/2) radius:radius startAngle:0 endAngle:M_PI_2 * 7 / 4 clockwise:YES];
    _cyclelayer1.path = cyclepatch1.CGPath;
    
    
    UIBezierPath *cyclepatch2 = [UIBezierPath bezierPath];
    [cyclepatch2 addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:M_PI endAngle:M_PI * 15 / 8 clockwise:YES];
    _cyclelayer2.path = cyclepatch2.CGPath;
    
    
    
    _startArrowPath1 = [UIBezierPath bezierPath];
    [_startArrowPath1 moveToPoint:CGPointMake(center.x + radius - 8, center.y + 4)];
    [_startArrowPath1 addLineToPoint:CGPointMake(center.x + radius, center.y)];
    [_startArrowPath1 addLineToPoint:CGPointMake(center.x + radius + 5, center.y + 5.5)];
    _arrawlayer1.path = _startArrowPath1.CGPath;
    
    
    _startArrowPath2 = [UIBezierPath bezierPath];
    [_startArrowPath2 moveToPoint:CGPointMake(center.x - radius + 8, center.y - 4)];
    [_startArrowPath2 addLineToPoint:CGPointMake(center.x - radius, center.y)];
    [_startArrowPath2 addLineToPoint:CGPointMake(center.x - radius - 5, center.y - 5.5)];
    _arrawlayer2.path = _startArrowPath2.CGPath;
    
    
    _endArrowPath1 = [UIBezierPath bezierPath];
    [_endArrowPath1 moveToPoint:CGPointMake(center.x + radius - 5, center.y -4)];
    [_endArrowPath1 addLineToPoint:CGPointMake(center.x + radius, center.y)];
    [_endArrowPath1 addLineToPoint:CGPointMake(center.x + radius + 3, center.y - 5.5)];
    
    
    _endArrowPath2 = [UIBezierPath bezierPath];
    [_endArrowPath2 moveToPoint:CGPointMake(center.x - radius + 6, center.y + 4)];
    [_endArrowPath2 addLineToPoint:CGPointMake(center.x - radius, center.y)];
    [_endArrowPath2 addLineToPoint:CGPointMake(center.x - radius - 8, center.y + 2.5)];
    
    
    
}

-(void)beginanimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(M_PI * 2);
    animation.toValue = @(0);
    animation.duration = 2;
    animation.repeatCount = LONG_MAX;
    [_baselayer addAnimation:animation forKey:@"baserotation"];
    
    
    CAKeyframeAnimation *keyanipath1 = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    keyanipath1.values = @[(__bridge id)_startArrowPath1.CGPath,(__bridge id)_endArrowPath1.CGPath,(__bridge id)_endArrowPath1.CGPath];
    keyanipath1.keyTimes = @[@(0.45f),@(.75f),@(.95f)];
    keyanipath1.repeatCount = LONG_MAX;
    keyanipath1.autoreverses = YES;
    keyanipath1.duration = 1;
    
    [_arrawlayer1 addAnimation:keyanipath1 forKey:@"changearr"];
    

    
    CAKeyframeAnimation *keyanipath2 = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    
    keyanipath2.values = @[(__bridge id)_startArrowPath2.CGPath,(__bridge id)_endArrowPath2.CGPath,(__bridge id)_endArrowPath2.CGPath];
    keyanipath2.keyTimes = @[@(0.45f),@(.75f),@(.95f)];
    keyanipath2.repeatCount = LONG_MAX;
    keyanipath2.autoreverses = YES;
    keyanipath2.duration = 1;
    
    [_arrawlayer2 addAnimation:keyanipath2 forKey:@"changearr"];
    
    
    
    
}
@end
