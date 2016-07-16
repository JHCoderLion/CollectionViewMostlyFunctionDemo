//
//  JHPublishFlowLayout.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/11.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHPublishFlowLayout.h"
#define Margin 20
#define maxCol 3
#define MarginTop 160
@implementation JHPublishFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.itemSize = CGSizeMake((ScreenWidth - Margin*(maxCol+1))/maxCol, 100);
        //间距都为0
        self.minimumInteritemSpacing = Margin;
        self.minimumLineSpacing = Margin;
        self.sectionInset = UIEdgeInsetsMake(MarginTop, Margin, 0, Margin);
        
    }
    return self;
}


@end
