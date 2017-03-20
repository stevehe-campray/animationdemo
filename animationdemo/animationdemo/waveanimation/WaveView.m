//
//  WaveView.m
//  animationdemo
//
//  Created by hejingjin on 17/3/17.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import "WaveView.h"

@implementation WaveView{

        CADisplayLink *_link;
        CGFloat _offset;
        CAShapeLayer *_layer;
        CAShapeLayer *_layer2;
        CGFloat _waveWidth;
        CGFloat _h;
    
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpInterface];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpInterface];
    }
    return self;
}


- (void)setUpInterface{
    _waveWidth = self.frame.size.width; //波形宽度
    _h = 30; //波形高度
    _layer = [CAShapeLayer layer];//一条波型
    _layer.opacity = 0.5;
    _layer.frame = self.bounds;
    
    
    _layer2 = [CAShapeLayer layer]; //第二条波型
    _layer2.frame = self.bounds;
    _layer2.opacity = 0.5;
    
    [self.layer addSublayer:_layer];
    [self.layer addSublayer:_layer2];
}

//开始动画
-(void)startanimation{
 
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(doanimation)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

-(void)doanimation{
    
    _offset += _speed;
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGFloat startY = _height*sinf(_offset*M_PI/_waveWidth);
    CGPathMoveToPoint(pathRef, NULL, 0, startY);
    for (CGFloat i = 0.0; i < _waveWidth; i ++) {
        CGFloat y = 1.1*_height*sinf(2.5*M_PI*i/_waveWidth + _offset*M_PI/_waveWidth) + _h;
        CGPathAddLineToPoint(pathRef, NULL, i, y);
    }
    
    CGPathAddLineToPoint(pathRef, NULL, _waveWidth, 40);
    CGPathAddLineToPoint(pathRef, NULL, 0, 40);
    CGPathCloseSubpath(pathRef);
    
    _layer.path = pathRef;
    _layer.fillColor = [UIColor lightGrayColor].CGColor;
    CGPathRelease(pathRef);
    
    CGMutablePathRef pathRef2 = CGPathCreateMutable();
    CGFloat startY2 = _height*sinf(_offset*M_PI/_waveWidth + M_PI/4);
    CGPathMoveToPoint(pathRef2, NULL, 0, startY2);
    for (CGFloat i = 0.0; i < _waveWidth; i ++) {
        CGFloat y = _height*sinf(2.5*M_PI*i/_waveWidth + 3*_offset*M_PI/_waveWidth + M_PI/4) + _h;
        CGPathAddLineToPoint(pathRef2, NULL, i, y);
    }
    CGPathAddLineToPoint(pathRef2, NULL, _waveWidth, 40);
    CGPathAddLineToPoint(pathRef2, NULL, 0, 40);
    CGPathCloseSubpath(pathRef2);
    
    _layer2.path = pathRef2;
    _layer2.fillColor = [UIColor lightGrayColor].CGColor;
    CGPathRelease(pathRef2);
    
    
}

//结束动画
-(void)stopanimation{
    
    [_link invalidate];
    _link = nil;
}

@end
