//
//  JHNewFeatureController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/28.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHNewFeatureController.h"
#import "JHNewFeatureCell.h"
#import "JHTabBarController.h"
#define MaxPage 4
@interface JHNewFeatureController ()

@end

@implementation JHNewFeatureController

static NSString * const reuseIdentifier = @"Lion";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //水平滚动
    layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    
    //设置大小
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    //间距
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollection];
  
}

- (void)setupCollection
{

    //开启分页
    self.collectionView.pagingEnabled = YES;
    //取消分割线
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;

    //取消弹簧效果
    self.collectionView.bounces = NO;
    
    //注册
    [self.collectionView registerClass:[JHNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];

    
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MaxPage;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JHNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
 
    
    cell.index = indexPath.item + 1;

    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == MaxPage - 1) {
        JHTabBarController *tabBarVC = [[JHTabBarController alloc] init];
//        [self.navigationController pushViewController:tabBarVC animated:YES];
        [self presentViewController:tabBarVC animated:YES completion:nil];
     
        [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
        
        [self.view removeFromSuperview];
    }

}


@end
