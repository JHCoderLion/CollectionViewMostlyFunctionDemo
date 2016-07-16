//
//  JHFlowLayout.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/20.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHFlowLayout.h"

@implementation JHFlowLayout


// 重要:
// UICollectionViewLayoutAttributes:
// 一个cell对应UICollectionViewLayoutAttributes对象
// UICollectionViewLayoutAttributes描述cell的布局


// 作用:计算布局,前提条件:如果cell的尺寸一开始就能固定,就在这个方法计算
// 什么时候调用:collectionView每次需要布局的时候就会调用
// collectionView确定数据,即将展示,才会布局
// 注意:必须要调用super
- (void)prepareLayout
{
    [super prepareLayout];
    
}

// 作用:返回指定区域的cell布局对象
// 什么时候调用:指定新的区域的时候调用
//- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    // 667
//    
//    //    NSLog(@"%@",NSStringFromCGRect(rect));
//    // 获取到指定区域cell的布局对象
//    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
//    
//        for (UICollectionViewLayoutAttributes *att in arr) {
//            att.transform = CGAffineTransformMakeScale(1.3, 1.3);
//            att.alpha = 0.5;
//        }
//    
//    
//    return arr;
//}



// 设置collectionView滚动范围
- (CGSize)collectionViewContentSize
{
    
    return [super collectionViewContentSize];
}


@end
