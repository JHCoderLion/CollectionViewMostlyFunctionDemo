//
//  JHSaveTool.h
//  练习- 彩票-01框架的搭建
//
//  Created by 赖锦浩 on 15/10/12.
//  Copyright © 2015年 赖锦浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHSaveTool : NSObject
 //读取
+ (id)objectForKey:(NSString *)defaultName;
 //存储
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
