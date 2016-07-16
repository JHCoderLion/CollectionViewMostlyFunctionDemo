//
//  UIBarButtonItem+JHExtension.h
//  Lion - baisi
//
//  Created by 赖锦浩 on 16/3/16.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JHExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
