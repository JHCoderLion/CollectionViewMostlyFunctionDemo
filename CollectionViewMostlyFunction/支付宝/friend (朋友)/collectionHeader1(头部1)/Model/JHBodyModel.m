//
//  JHCollectionHeaderController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/15.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "JHBodyModel.h"

@implementation JHBodyModel
+ (instancetype)bodyWithDict:(NSDictionary *)dict
{
    JHBodyModel *body = [[JHBodyModel alloc] init];
    body.poi_name = dict[@"poi_name"];
    body.imageURL = dict[@"imageURL"];
    body.section_title = dict[@"section_title"];
    body.fav_count = dict[@"fav_count"];
    
    return body;
}
@end
