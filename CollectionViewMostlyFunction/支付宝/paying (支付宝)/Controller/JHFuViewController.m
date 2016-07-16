//
//  JHFuViewController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/28.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

//将你需要进入的控制器添加到此...
#import "JHFuViewController.h"
#import "JHNewFeatureController.h"
#import "JHCollectionHeaderController.h"
@interface JHFuViewController ()

@end

@implementation JHFuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)textBtnClick:(id)sender {
    

}




- (void)gotoNewFeature
{
    JHNewFeatureController *newFeature = [[JHNewFeatureController alloc] init];
    [self.navigationController pushViewController:newFeature animated:YES];
    
    [self.view removeFromSuperview];
    
    //隐藏导航条
    self.navigationController.navigationBar.hidden = YES;
}

@end
