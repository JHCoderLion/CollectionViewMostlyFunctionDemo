//
//  JHshowBigPictureController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHshowBigPictureController.h"
#import "JHShowBigCell.h"
#import "JHSeeBigController.h"
#define MaxCol 3
#define imageCount 20

@interface JHshowBigPictureController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 保存图片的数组  */
@property (nonatomic, strong) NSMutableArray *pictureArray;

@end

@implementation JHshowBigPictureController
static NSString *const kShowBigID = @"JHShowBigCell";
#pragma mark - 懒加载
- (NSMutableArray *)pictureArray
{
    if (!_pictureArray) {
        _pictureArray = [NSMutableArray array];
        for (int i = 1; i<=imageCount; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%zd",i];
            //保存item里面的每一张图片
            [self.pictureArray addObject:[UIImage imageNamed:imageName]];
        }

    }
    
    return _pictureArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JHRandomColor;

    self.collectionView.backgroundColor = JHRandomColor;
    
    self.collectionView.bounces = NO;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
       
    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHShowBigCell class]) bundle:nil] forCellWithReuseIdentifier:kShowBigID];
}

#pragma mark - 初始化
- (instancetype)init {

    //创建流水布局
    UICollectionViewFlowLayout *layout = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        //设置间距
        NSInteger margin = 10;
        layout.minimumInteritemSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        
        //设置item尺寸
        CGFloat itemW = (ScreenWidth - (MaxCol + 1) * margin) / MaxCol;
        CGFloat itemH = itemW;
        layout.itemSize = CGSizeMake(itemW, itemH);
        
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);

        // 设置水平滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        layout;
    });

    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    
    return self;
}


#pragma mark - UICollectionViewDataSource

//返回每一组有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pictureArray.count;
}

//返回每一个Item的详细显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JHShowBigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kShowBigID forIndexPath:indexPath];
    
//    NSString *imageName = [NSString stringWithFormat:@"%zd",indexPath.item + 1];
//    cell.image = [UIImage imageNamed:imageName];
//    //保存item里面的每一张图片
//    [self.pictureArray addObject:cell.image];
    
    cell.image = self.pictureArray[indexPath.item];

    return cell;
}
#pragma mark -UICollectionViewDelegate
//点击item的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
#warning block
//    self.showBigPicture(indexPath);
    

    
    JHSeeBigController *seeBig = [[JHSeeBigController alloc] init];
    seeBig.index = indexPath;
    seeBig.itemArray = self.pictureArray;
    [self.navigationController presentViewController:seeBig animated:YES completion:nil];
    
    //转场动画
    [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
    
    
}

@end
