//
//  JHSeeBigCell.m
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHSeeBigCell.h"

@interface JHSeeBigCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bigImageV;


@end
@implementation JHSeeBigCell

- (void)awakeFromNib {
 
}


- (void)setBigImage:(UIImage *)bigImage
{
    _bigImage = bigImage;
    _bigImageV.image = bigImage;

}

@end
