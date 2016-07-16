//
//  JHCollectionHeaderController.m
//  支付宝
//
//  Created by 赖锦浩 on 16/5/15.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHBodyModel.h"
@interface JHHomeModel : NSObject
/** 颜色 */
@property (nonatomic, copy) NSString *color;

/** 名字 */
@property (nonatomic, copy) NSString *tag_name;

/** 精选个数 */
@property (nonatomic, copy) NSString *section_count;

/** 数组  */
@property (nonatomic, strong) NSArray *body;

+ (instancetype)homeWithDict:(NSDictionary *)dict;

@end
