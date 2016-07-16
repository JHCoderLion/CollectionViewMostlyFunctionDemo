//
//  JHUserBtuuon.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHUserBtuuon.h"

@implementation JHUserBtuuon


- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}

- (void)layoutSubviews
{
    //设置图片的位置
    self.imageView.centerY = self.height * 0.5;
    self.imageView.x = 0;
    
    //设置文字的位置
    self.titleLabel.centerY = self.imageView.centerY;
    self.titleLabel.x = self.imageView.x;
    self.titleLabel.width = self.width - self.imageView.width;
    
}


@end
