//
//  JHNavigationController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/19.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



/**
 *  拦截所有push进来的子控制器
 *  @param viewController 每一次push进来的子控制器
 *  @param animated       动画效果
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 左上角的返回
    if (self.childViewControllers.count >= 1) {
        
//        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        [backButton sizeToFit];
//        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES; //隐藏底部的工具条
        
    }

    [super pushViewController:viewController animated:animated];
    
    
}

- (void)back
{
    
}
@end
