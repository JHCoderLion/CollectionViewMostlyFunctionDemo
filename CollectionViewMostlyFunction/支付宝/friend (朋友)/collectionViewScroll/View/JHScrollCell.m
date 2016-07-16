//
//  JHScrollCell.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/14.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHScrollCell.h"

@interface JHScrollCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation JHScrollCell

- (void)awakeFromNib {


}

- (void)setupPage
{
    //创建page
    UIPageControl *page = [[UIPageControl alloc] init];
    page.numberOfPages = 5;
}



-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

}

@end
