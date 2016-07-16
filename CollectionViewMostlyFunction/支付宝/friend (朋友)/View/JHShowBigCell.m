//
//  JHShowBigCell.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHShowBigCell.h"

@interface JHShowBigCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
@implementation JHShowBigCell

- (void)awakeFromNib {

}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageV.image = image;
}

@end
