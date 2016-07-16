//
//  JHNewFeatureCell.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/28.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHNewFeatureCell.h"

@interface JHNewFeatureCell ()
/** 图片属性  */
@property (nonatomic,weak) UIImageView *featureImageV;
/** 跳过按钮  */
@property (nonatomic,weak) UIButton *clearBtn;
@end
@implementation JHNewFeatureCell
#pragma mark - 懒加载
- (UIImageView *)featureImageV
{
    if (!_featureImageV) {
        UIImageView *image = [[UIImageView alloc] init];
        image.frame = [UIScreen mainScreen].bounds;
        [self.contentView addSubview:image];
        self.featureImageV = image;
    }
    
    return _featureImageV;
}

- (UIButton *)clearBtn
{
    if (!_clearBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"跳过"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [self.contentView addSubview:btn];
        [btn addTarget:self action:@selector(clearBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.clearBtn = btn;
            
        
    }
    
    return _clearBtn;
}

- (void)clearBtnClick
{
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kNewFeatureNotify object:nil];
   
    
}

//初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


//布局
- (void)layoutSubviews
{
    //布局图片的尺寸
    self.featureImageV.frame = [UIScreen mainScreen].bounds;

    //布局跳过按钮
    self.clearBtn.center = CGPointMake(ScreenWidth * 0.85, ScreenHeight * 0.1);

}

#pragma mark - 传值给外面的方法
- (void)setIndex:(NSInteger)index
{
    _index = index;
    NSString *imageN = [NSString stringWithFormat:@"guide_iphone5_%zd",index];
    self.featureImageV.image = [UIImage imageNamed:imageN];

}



@end
