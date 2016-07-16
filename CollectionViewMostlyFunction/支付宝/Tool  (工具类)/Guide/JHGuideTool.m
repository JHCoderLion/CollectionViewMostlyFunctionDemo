//
//  JHGuideTool.m
//  练习- 彩票-01框架的搭建
//
//  Created by 赖锦浩 on 15/10/12.
//  Copyright © 2015年 赖锦浩. All rights reserved.
//

#import "JHGuideTool.h"
#import "JHNewFeatureController.h"
#import "JHSaveTool.h"
#import "JHTabBarController.h"
#define JHVersionKey @"curVersion"
#define JHUserDefaults [NSUserDefaults standardUserDefaults]
@implementation JHGuideTool
+ (UIViewController *)chooseRootViewController
{
    UIViewController *rootVc = nil;
    // 获取info.plist
//    NSString *infoPath = [[NSBundle mainBundle] pathForResource:@"Info.plist" ofType:nil];
    //加载info.plist
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    
    //获取最新的版本号
    NSString *curVersion = dict[@"CFBundleShortVersionString"];
    
    //获取上一次的版本号
    NSString *lastVersion = [JHSaveTool objectForKey:JHVersionKey];
    
    //判断当前是否为最新版本
    if ([curVersion isEqualToString:lastVersion]) { //版本号相同
        //版本号相等
        rootVc = [[JHTabBarController alloc] init];

        NSLog(@"进入主框架");
        
        //转场动画
        [JHPushAnimation AnimationUpturnType:@"reveal"];
        
    }else
    {
        
        //保存最新版本 \
        保存到偏好设置
        [JHSaveTool setObject:curVersion forKey:@"curVersion"];
        NSLog(@"进入新特性界面");
        //创建新特性界面
        rootVc = [[JHNewFeatureController alloc]init];
        
        
    }
    return rootVc;


}
@end
