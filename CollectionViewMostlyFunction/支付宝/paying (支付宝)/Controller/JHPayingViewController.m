//
//  JHPayingViewController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/19.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHPayingViewController.h"
#import "JHFlowLayout.h"
#import "JHHeaderCell.h"
#import "JHContentCell.h"
#import "JHCollectionScrollCell.h"
#import "JHSaoYiSaoController.h"
#import "JHFuViewController.h"
#define MAS_SHORTHAND
//这个是可以消除参数中的mas;
#define MAS_SHORTHAND_GLOBALS
//这个是可以消除mas_equalTo中的mas;
#import "Masonry.h"
#define headHeight 100
#define Padding 1
@interface JHPayingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) UICollectionView*  collectionView;
/** 头部视图  */
@property (nonatomic,weak) UIView *headView;
/** 扫一扫  */
@property (nonatomic,weak) UIButton *saoBtn;
/** 付款码  */
@property (nonatomic,weak) UIButton *fuBtn;
/** 保存数据的数组  */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation JHPayingViewController
static NSString * const kHeaderIdentifier = @"JHHeaderCell";
static NSString * const kContentIdentifier = @"JHContentCell";
static NSString * const kScrollIdentifier = @"JHCollectionScrollCell";
#pragma mark - 懒加载
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付宝";
//    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbar_arrow_down"]];
//    self.navigationItem.titleView = image;
    //取消滑动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //布局头部
    [self setupHeaderView];
    //设置collectionView
    [self setupCollection];
 
    
}
/** 初始化头部视图 */
- (void)setupHeaderView
{
    /********* headView ************/
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor purpleColor];
    headView.frame = CGRectMake(0, 64, ScreenWidth, headHeight);
    [self.view addSubview:headView];
    self.headView = headView;
    
    /********* 扫一扫按钮 ************/
    UIButton *saoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saoBtn setBackgroundImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateNormal];
    [self.headView addSubview:saoBtn];
    self.saoBtn = saoBtn;
    CGFloat saoWidth = ScreenWidth * 0.5;
    CGFloat saoHeight = headHeight;
    CGFloat saoX = 0;
    CGFloat saoY = 0;
    saoBtn.frame = CGRectMake(saoX, saoY, saoWidth, saoHeight);
    [saoBtn addTarget:self action:@selector(clickSao) forControlEvents:UIControlEventTouchUpInside];
  
    /********* 付款码按钮 ************/
    UIButton *fuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fuBtn setBackgroundImage:[UIImage imageNamed:@"付款码"] forState:UIControlStateNormal];
    [self.headView addSubview:fuBtn];
    self.fuBtn = fuBtn;
    CGFloat fuWidth = ScreenWidth * 0.5;
    CGFloat fuHeight = headHeight;
    CGFloat fuX = ScreenWidth * 0.5;
    CGFloat fuY = 0;
    fuBtn.frame = CGRectMake(fuX, fuY, fuWidth, fuHeight);
    [fuBtn addTarget:self action:@selector(clickFu) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark - 点击
- (void)clickSao
{
    JHSaoYiSaoController *saoyisao = [[JHSaoYiSaoController alloc] init];
    [self.navigationController pushViewController:saoyisao animated:YES];
}
- (void)clickFu
{
    JHFuViewController *fuView = [[JHFuViewController alloc] init];
    [self.navigationController pushViewController:fuView animated:YES];
}

/** 初始化collectionView*/
- (void)setupCollection
{
    UICollectionViewFlowLayout *layout = ({
        
        UICollectionViewFlowLayout *layout = [[JHFlowLayout alloc] init];
        
        // 设置尺寸
//        CGFloat itemWidth = ScreenWidth / 4;
//        layout.itemSize = CGSizeMake(itemWidth, 120);
        
        // 设置水平滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;

//        layout.sectionInset = UIEdgeInsetsMake(0, 0, 100, 100);
        
        // 设置cell间距
//        layout.minimumInteritemSpacing = 50;
//        layout.minimumLineSpacing = 50;
        
        layout;
        
    });

    UICollectionView*  collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 164,self.view.width,self.view.height - 210) collectionViewLayout:layout];
  
    collectionView.contentInset = UIEdgeInsetsMake(2, 0, 2, 0);
    collectionView.delegate = self;
    collectionView.dataSource =self;

    collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView = collectionView;
    //取消弹簧
//    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.bounces = NO;


    
    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHContentCell class]) bundle:nil] forCellWithReuseIdentifier:kContentIdentifier];
    [self.view addSubview:collectionView];
    
    //注册头部的标识
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHCollectionScrollCell class]) bundle:nil] forCellWithReuseIdentifier:kScrollIdentifier];

    
    //为collectionView增加长按手势,用来移动item
    UILongPressGestureRecognizer *longRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveItem:)];
    [self.collectionView addGestureRecognizer:longRecognizer];
}



#pragma  mark - 移动item
//移动item的时候调用
- (void)moveItem:(UILongPressGestureRecognizer *)longPressGesture
{
    switch (longPressGesture.state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longPressGesture locationInView:self.collectionView]];
            if (indexPath == nil) {
                break;
            }
//            if (indexPath.row == 12) {
//                break;
//            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longPressGesture locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

//返回YES允许其item移动
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 12) {
        return NO;
    }
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    //取出源item数据
//    id objc = [self.dataArray objectAtIndex:sourceIndexPath.item];
//    //从资源数组中移除该数据
//    [self.dataArray removeObject:objc];
//    //将数据插入到资源数组中的目标位置上
//    [self.dataArray insertObject:objc atIndex:destinationIndexPath.item];
}


#pragma mark -- Footer and Header
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//          viewForSupplementaryElementOfKind:(NSString *)kind
//                                atIndexPath:(NSIndexPath *)indexPath{
//    // 如果是头视图
//    if (kind == UICollectionElementKindSectionHeader) {
//        // 从重用池里面取
//        JHHeaderCell *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
//        return headerView;
//    }else{
//        return nil;
//    }
//}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 12) {
        JHCollectionScrollCell *scrollCell = [collectionView dequeueReusableCellWithReuseIdentifier:kScrollIdentifier forIndexPath:indexPath];
        return scrollCell;
    }
    JHContentCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kContentIdentifier forIndexPath:indexPath];
    
    
    return cell;

}

#pragma mark - UICollectionViewDelegateFlowLayout

//定义每个UICollectionView的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);

    
}

#pragma mark -UICollectionViewDelegate
//UICollectionView被选中的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.item);
}

// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}

/**
 *  返回item的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==12) {
        CGFloat itemW = ScreenWidth;
        CGFloat itemH = 100;
        return  CGSizeMake(itemW, itemH);;
    }
    
    CGFloat itemW = (ScreenWidth - 5) / 4;
    CGFloat itemH = 100;
    return CGSizeMake(itemW, itemH);
}

/**
 *  返回item最小的间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    if (section == 1) {
        return 20;
    }
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}



@end
