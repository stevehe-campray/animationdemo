//
//  WaveView.h
//  animationdemo
//
//  Created by hejingjin on 17/3/17.
//  Copyright © 2017年 teamsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView

@property(nonatomic,assign)CGFloat height; //最大高度
@property(nonatomic,assign)CGFloat speed;  //速度

-(void)startanimation;
-(void)stopanimation;
@end
