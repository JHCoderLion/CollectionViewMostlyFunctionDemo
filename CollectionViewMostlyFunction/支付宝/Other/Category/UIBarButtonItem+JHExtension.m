//
//  UIBarButtonItem+JHExtension.m
//  Lion - baisi
//
//  Created by 赖锦浩 on 16/3/16.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "UIBarButtonItem+JHExtension.h"

@implementation UIBarButtonItem (JHExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:btn];
    
}
 

@end
