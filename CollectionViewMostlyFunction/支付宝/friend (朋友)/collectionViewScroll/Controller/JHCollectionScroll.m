//
//  JHCollectionScroll.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/11.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHCollectionScroll.h"
#import "JHScrollCell.h"

#define CollectionHeight 200
#define imageCount 5
#define maxSection 4
@interface JHCollectionScroll ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/** 保存图片的数据  */
@property (nonatomic, strong) NSMutableArray *pictureArray;
/** 定时器  */
@property (nonatomic, strong) NSTimer  *timer;

/** page  */
@property (nonatomic,weak) UIPageControl *page;
/** collectionView  */
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation JHCollectionScroll
static NSString *const scrollID = @"JHCollectionViewScrollCell";
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

    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏是否透明
    self.navigationController.navigationBar.translucent = NO;
    //初始化collectionView
    [self setupCollectionView];
   
}


- (void)setupCollectionView
{
    //布局流水对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置item的大小
    layout.itemSize = CGSizeMake(ScreenWidth,200);
    
    //设置间距
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

    
    //水平方向滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,CollectionHeight) collectionViewLayout:layout];

    //设置分页
    collectionView.pagingEnabled = YES;
    
    //设置弹簧效果
    collectionView.bounces = NO;

    
    //设置数据源
    collectionView.dataSource = self;
    //设置代理
    collectionView.delegate = self;
    
    collectionView.backgroundColor = [UIColor blueColor];
    
    //取消滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    collectionView.contentSize = CGSizeMake(self.pictureArray.count * self.collectionView.frame.size.width, 0);
    
    //保存
    self.collectionView = collectionView;
    
    //将UICollectionView添加到当前的View上
    [self.view addSubview:collectionView];
    
    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHScrollCell class]) bundle:nil] forCellWithReuseIdentifier:scrollID];
    
    //初始化page
    [self setupPage];
    
}

- (void)setupPage
{
    //设置UIPageControl
    UIPageControl *page = [[UIPageControl alloc] init];
    //设置个数
    page.numberOfPages = self.pictureArray.count;
    self.page = page;
    
    //设置page的颜色
    //全部page的颜色
    self.page.pageIndicatorTintColor = [UIColor whiteColor];
    //当前Page的颜色
    self.page.currentPageIndicatorTintColor = [UIColor redColor];
    
    //添加当前的View上
    [self.view addSubview:page];
    
    NSInteger collectionViewWidth = self.collectionView.frame.size.width;
    NSInteger collectionViewHeight = self.collectionView.frame.size.height;
    
    CGFloat pageW = 80;
    CGFloat pageH = 20;
    CGFloat pageX = collectionViewWidth - 80;
    CGFloat pageY = collectionViewHeight - 20;
    self.page.frame = CGRectMake(pageX, pageY, pageW, pageH);
    

    //启动定时器
    [self setTimer];
}

/** 定时器 */
- (void)setTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES]
    ;
    //添加到当前RunLoop的状态
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.timer = timer;
}

/** 取消定时器 */
- (void)removeTimer
{
    //属性: 使定时器失效
    [self.timer invalidate];
    self.timer = nil;
}


/**  下一页 */
- (void)nextPage
{
    //算出当前的索引
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems]lastObject];
    //计算出重新排布的item
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:maxSection/2];
    //到哪个item
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    //下一个item
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    
    //判断是不是最后一个索引
    if (nextItem == self.pictureArray.count) {
        nextItem = 0;
//        nextItem ++;
        nextSection ++;
    }
    
    
    //算出下一个索引
    NSIndexPath *nextIndexPath  = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    //到下一个的item
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
  
}




#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
     return maxSection;
    
}
//每组有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pictureArray.count;

}

//每个item的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JHLog(@"%zd,%zd",indexPath.section,indexPath.item);

    JHScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:scrollID forIndexPath:indexPath];

    cell.backgroundColor = (indexPath.item % 2) ? [UIColor redColor]:[UIColor greenColor];
    //赋值图片
    cell.image = self.pictureArray[indexPath.row];
    
//    NSLog(@"第%zd组------第%zd行",indexPath.section,indexPath.row);

    return cell;

}

#pragma mark - collectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"点击了第%zd组,第%zd行",indexPath.section,indexPath.row);
    JHLogIndexPath
}

#pragma mark - scrollviewDeleagate
/** scrollView滚动的时候调用 */
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    //设置页码
    int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.pictureArray.count;
    self.page.currentPage =page;
}

/** 当用户即将拖拽的时候调用 */
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

/** 当用户停止拖拽的时候调用 */
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setTimer];
    
}
@end
