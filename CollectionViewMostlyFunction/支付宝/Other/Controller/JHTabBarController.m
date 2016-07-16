//
//  JHTabBarController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/19.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHTabBarController.h"
#import "JHPayingViewController.h"
#import "JHFriendViewController.h"
#import "JHMeController.h"
#import "JHPraiseFoodViewController.h"
#import "JHTabBar.h"
#import "JHNavigationController.h"
@interface JHTabBarController ()

@end

@implementation JHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加所有的子控制器
    [self addChildViewControlle];
    //设置TabBar
    [self setupTabBar];
    //设置item
    [self setupItem];
 
    
}
//设置TabBar
- (void)setupTabBar
{
    [self setValue:[[JHTabBar alloc] init] forKeyPath:@"TabBar"];
    
}


/** 添加子控件 */
- (void)addChildViewControlle
{
    [self setViewController:[[JHPayingViewController alloc] init] title:@"支付宝" image:@"TabBar_Assets" hightImage:@"TabBar_Assets_Sel"];
    [self setViewController:[[JHPraiseFoodViewController alloc] init] title:@"口碑" image:@"TabBar_Businesses" hightImage:@"TabBar_Businesses_Sel"];
    [self setViewController:[[JHFriendViewController alloc] init] title:@"朋友" image:@"TabBar_Friends" hightImage:@"TabBar_Friends_Sel"];
    [self setViewController:[[JHMeController alloc] init] title:@"我的" image:@"TabBar_Assets" hightImage:@"TabBar_Assets_Sel"];

}

/** 添加控制器的方法 */
- (void)setViewController:(UIViewController *)ViewController title:(NSString *)title image:(NSString *)image hightImage:(NSString *)hightImage
{
    //包装一个导航控制器
    JHNavigationController *nav = [[JHNavigationController alloc] initWithRootViewController:ViewController];
    
    //将导航控制器添加到TabBar里面
    [self addChildViewController:nav];
    
    ViewController.tabBarItem.title = title;
    ViewController.tabBarItem.image = [UIImage imageNamed:image];
    ViewController.tabBarItem.selectedImage = [UIImage imageNamed:hightImage];

}

/**
 *  给item设置属性
 */
- (void)setupItem
{
//    self.tabBar.tintColor = [UIColor blackColor];
    
    //UIControlStateNormal 状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    //文字的颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //字体的大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    //    UIControlStateSelected的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    //选中的文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


@end
