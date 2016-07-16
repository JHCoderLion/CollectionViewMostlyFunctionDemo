//
//  JHPushAnimation.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.




#import "JHPushAnimation.h"

@implementation JHPushAnimation
//水滴
+ (void)AnimationUpturnType:(NSString *)type
{
    CATransition *anim = [CATransition animation];
    anim.type = type;
    anim.duration = 1;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:anim forKey:nil];


}
@end
