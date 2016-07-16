//
//  JHQuickLoginButton.m
//  Lion-百思不得姐
//
//  Created by 赖锦浩  
//  Copyright © 2015年 赖锦浩. All rights reserved.
//

#import "JHQuickLoginButton.h"
@implementation JHQuickLoginButton
//加载xib的时候调用
- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = JHRandomColor;
    [self setTitleColor:JHRandomColor forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置图片的位置
    self.imageView.y = 5;
    self.imageView.centerX = self.width * 0.5;
    
    //设置文字的位置
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
    

}


@end
