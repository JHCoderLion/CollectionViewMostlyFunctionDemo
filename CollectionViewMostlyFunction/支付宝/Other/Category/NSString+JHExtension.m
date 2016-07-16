//
//  NSString+JHExtension.m
//  Lion - baisi
//
//  Created by 赖锦浩 on 16/3/23.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "NSString+JHExtension.h"

@implementation NSString (JHExtension)

- (NSInteger)fileSize
{
    //文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    //是否为文件夹
    BOOL isDirectory = NO;
    //这个路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    //路径如果不存在
    if (exists == NO) return 0;
    
    if (isDirectory) { //文件夹
        //总大小
        NSInteger size = 0;
        //获得文件夹中的所有内容
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            //获得全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            //获得文件属性
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
        return size;
    } else {
        //文件
        return [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }

}


@end
