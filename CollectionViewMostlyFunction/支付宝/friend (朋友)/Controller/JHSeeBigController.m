//
//  JHSeeBigController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHSeeBigController.h"
#import "JHshowBigPictureController.h"
#import "JHSeeBigCell.h"
#import "SVProgressHUD.h"
@interface JHSeeBigController ()<UICollectionViewDataSource,UICollectionViewDelegate>

/** collectionView  */
@property (nonatomic,weak) UICollectionView *collectionView;
/** 图片属性  */
@property (nonatomic,weak) UIImageView *bigImageView;
@end

@implementation JHSeeBigController
static NSString *const kSeeBigID = @"seeBig";

int tmpNum = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollection];
    
    //点击图片的时候就滚到对应的index中
    [self.collectionView scrollToItemAtIndexPath:self.index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

}

- (void) setupCollection
{
    //布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.view.bounds.size;
    //间距都为0
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建UICollectionView
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
    collection.pagingEnabled = YES;
    collection.bounces = NO;
    //设置数据源和代理
    collection.delegate = self;
    collection.dataSource = self;
    self.collectionView = collection;
    self.collectionView.showsHorizontalScrollIndicator = NO;

//        [self.view addSubview:collection];
    [self.view insertSubview:collection atIndex:0];
    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHSeeBigCell class]) bundle:nil] forCellWithReuseIdentifier:kSeeBigID];
    
    //添加点击的图片到collectionView上
//    UIImageView *bigImageView = [[UIImageView alloc] init];
//    bigImageView.frame = self.collectionView.bounds;
//    bigImageView.backgroundColor = [UIColor yellowColor];
//    //    [self.collectionView addSubview:bigImageView];
//    [self.collectionView insertSubview:bigImageView atIndex:_index.item+1];
//    NSString *imageName = [NSString stringWithFormat:@"%zd",self.index.item + 1];
//    
//    //    NSLog(@"---imageName------%@,----index------%@",imageName,self.index);
//    bigImageView.image = [UIImage imageNamed:imageName];
//    

}


- (void)nextPage
{
    tmpNum += 1;
    //添加大图的图片到collectionView上
    UIImageView *bigImageView = [[UIImageView alloc] init];
    
    CGRect ScreenR = CGRectMake([UIScreen mainScreen].bounds.size.width * (tmpNum - 1), 0, ScreenWidth, ScreenHeight);
    bigImageView.frame = ScreenR;
    
    NSLog(@"%@",NSStringFromCGRect(self.collectionView.bounds));
    bigImageView.backgroundColor = [UIColor yellowColor];
    [self.collectionView insertSubview:bigImageView atIndex:_index.item + 1];
    //添加对应的图片
    
    
    NSString *imageName = [NSString stringWithFormat:@"%zd",self.index.item + tmpNum];
    NSLog(@"-------%@",imageName);

    bigImageView.image = [UIImage imageNamed:imageName];
    [self.collectionView scrollToItemAtIndexPath:self.index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

    [self.view layoutIfNeeded];
 
}

#pragma mark -按钮的点击
//退出大图
- (IBAction)backClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [JHPushAnimation AnimationUpturnType:@"rippleEffect"];
}
//保存图片
- (IBAction)saveClick:(id)sender {
    // 添加图片到【相机胶卷】相簿中
    UIImageWriteToSavedPhotosAlbum(self.bigImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }else
    {
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }
}

#pragma mark -<UIScrollViewDelegate>
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.bigImageView;
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    JHSeeBigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSeeBigID forIndexPath:indexPath];
//    cell.backgroundColor = (indexPath.item % 2)?[UIColor redColor]:[UIColor greenColor];
    cell.bigImage = self.itemArray[indexPath.item];
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    [self nextPage];

}


@end
