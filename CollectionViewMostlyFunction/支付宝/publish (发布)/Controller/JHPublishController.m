//
//  JHPublishController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/30.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHPublishController.h"
#import "JHPublishCell.h"
#import "JHPublishFlowLayout.h"
@interface JHPublishController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
/** collection  */
@property (nonatomic,weak) UICollectionView *collectionView;

/** 存放图片的数组  */
@property (nonatomic, strong) NSArray *images;
/** 存放文字的按钮  */
@property (nonatomic, strong) NSArray *titles;



@end

@implementation JHPublishController
static NSString *const kPublishID = @"JHPublishCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupCollection];
}

- (void)setupDate
{
    //数据
   self.images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    self.titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    }

- (void)setupCollection
{
    //布局对象
    JHPublishFlowLayout *layout = [[JHPublishFlowLayout alloc] init];

    
    //创建UICollectionView
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
    collection.bounces = NO;
    //设置数据源和代理
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    self.collectionView = collection;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //  [self.view addSubview:collection];
    [self.view insertSubview:collection atIndex:0];

    //注册
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JHPublishCell class]) bundle:nil] forCellWithReuseIdentifier:kPublishID];

}


/** 点击取消按钮  */
- (IBAction)cancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JHPublishCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPublishID forIndexPath:indexPath];
    
    cell.images = self.images;
    cell.titles = self.titles;
    
    return cell;
    
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

 


@end
