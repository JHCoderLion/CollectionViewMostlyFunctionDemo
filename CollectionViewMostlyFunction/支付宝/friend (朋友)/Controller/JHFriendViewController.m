//
//  JHFriendViewController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHFriendViewController.h"
#import "JHFriendCell.h"
#import "JHshowBigPictureController.h"
#import "JHCollectionScroll.h"
#import "JHCollectionHeaderController.h"
@interface JHFriendViewController ()<UITableViewDataSource,UITableViewDelegate>

/** tableView  */
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation JHFriendViewController
static NSString * const kFriendID = @"JHFriendCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"朋友";
    
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
 
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];

    //注册
    [self.tableView registerClass:[JHFriendCell class] forCellReuseIdentifier:kFriendID];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- ( NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:kFriendID];
    if (indexPath.row == 0 & indexPath.section == 0) {
        cell.textLabel.text = @"点击进入CollectionView点击变大图界面";
    }else if (indexPath.row == 1 & indexPath.section == 0)
    {
        cell.textLabel.text = @"点击进入collectionView滚动界面";
    }else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"点击跳转到头部视图漂浮界面";
    }else
    {
    
        cell.textLabel.text = [NSString stringWithFormat:@"section---- %zd--row-- %zd",indexPath.section,indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHshowBigPictureController *showBig = [[JHshowBigPictureController alloc] init];
    
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:showBig animated:YES];
     
        //水滴效果的转场动画
        [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
        
    }else if (indexPath.row == 1)
    {
        JHCollectionScroll *collectionScroll = [[JHCollectionScroll alloc] init];
        
        [self.navigationController pushViewController:collectionScroll animated:NO];
        //水滴效果的转场动画
        [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
        
    }else if (indexPath.row == 2) //跳转到头部视图漂浮界面
    {
        JHCollectionHeaderController *header = [[JHCollectionHeaderController alloc] init];
        [self.navigationController pushViewController:header animated:YES];
        
        //水滴效果的转场动画
        [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
    }

}

@end
