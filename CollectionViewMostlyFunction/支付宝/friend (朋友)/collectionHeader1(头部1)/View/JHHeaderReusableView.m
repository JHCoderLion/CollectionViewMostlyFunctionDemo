//
//  JHCollectionHeaderController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/15.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHHeaderReusableView.h"
#import "JHHomeModel.h"
@interface JHHeaderReusableView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
@implementation JHHeaderReusableView

- (void)awakeFromNib {


}

/** 赋值 */
- (void)setHomeModel:(JHHomeModel *)homeModel
{
    _homeModel = homeModel;

    self.nameLabel.text = homeModel.tag_name;
    self.countLabel.text = homeModel.section_count;
    
    self.backgroundColor = [UIColor colorWithHexString:homeModel.color];
//    self.backgroundColor = JHRandomColor;
}
/** 点击头部视图的跳转 */
- (IBAction)clickHeader:(UIButton *)sender {
    
    JHLogFunc;
}

@end
