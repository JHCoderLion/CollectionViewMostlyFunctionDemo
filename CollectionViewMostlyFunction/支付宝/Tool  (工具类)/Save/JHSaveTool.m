//
//  JHSaveTool.m
//  练习- 彩票-01框架的搭建
//
//  Created by 赖锦浩 on 15/10/12.
//  Copyright © 2015年 赖锦浩. All rights reserved.
//

#import "JHSaveTool.h"
#define JHUserDefaults [NSUserDefaults standardUserDefaults]

@implementation JHSaveTool

+(id)objectForKey:(NSString *)defaultName
{
    return [JHUserDefaults objectForKey:defaultName];

}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    return [JHUserDefaults setObject:value forKey:defaultName];

}
@end
