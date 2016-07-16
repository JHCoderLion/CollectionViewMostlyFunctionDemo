//
//  JHCollectionHeaderController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/15.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//


#import "JHHomeModel.h"

@implementation JHHomeModel
+ (instancetype)homeWithDict:(NSDictionary *)dict
{
    JHHomeModel *home = [[JHHomeModel alloc] init];
    home.tag_name = dict[@"tag_name"];
    home.section_count  = dict[@"section_count"];
    home.color = dict[@"color"];
    
    //字典数组转模型
    //保存模型的临时数组
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dictArray in dict[@"body"]) {
        JHBodyModel *body = [JHBodyModel bodyWithDict:dictArray];
        [temp addObject:body];
    }
    home.body = temp;
    
    return home;

}
@end
