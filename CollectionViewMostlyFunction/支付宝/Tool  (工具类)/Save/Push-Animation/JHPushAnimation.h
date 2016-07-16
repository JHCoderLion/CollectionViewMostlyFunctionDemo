//
//  JHPushAnimation.h
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//
/*
 NSString ↓
 rippleEffect 水滴效果;
 reveal 新的将旧的推出
 
 */
#import <Foundation/Foundation.h>

@interface JHPushAnimation : NSObject
//转场动画 
+ (void)AnimationUpturnType:(NSString *)type;



@end
