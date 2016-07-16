//
//  JHCollectionHeaderController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/15.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHBodyCell.h"
#import "JHBodyModel.h"
#import "UIImageView+WebCache.h"
@interface JHBodyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UIButton *countBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
@implementation JHBodyCell

- (void)awakeFromNib {

    self.backgroundColor = JHRandomColor;
}

//collectionView重写Frame不能修改间距,它里面有修改间距的属性
//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y -= 10;
//    
//    [super setFrame:frame];
//
//}

/** 赋值 */
- (void)setBodyModel:(JHBodyModel *)bodyModel
{
    _bodyModel = bodyModel;
    self.titleLabel.text = bodyModel.section_title;
    [self.nameBtn setTitle:bodyModel.poi_name forState:UIControlStateNormal];
    [self.countBtn setTitle:bodyModel.fav_count forState:UIControlStateNormal];
    
    NSURL *url = [NSURL URLWithString:bodyModel.imageURL];
    [self.imageV sd_setImageWithURL:url];
}

@end
