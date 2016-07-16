//
//  UIImage+JHExtension.m
//  Lion - baisi
//
//  Created by 赖锦浩 on 16/3/18.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "UIImage+JHExtension.h"

@implementation UIImage (JHExtension)

- (instancetype)circleImage
{
    //开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    //上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //图片的尺寸
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    
    
    //裁剪图片
    CGContextClip(context);
    
    //绘制图片到圆上面
    [self drawInRect:rect];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();

    
    return image;
}

+ (instancetype)circleImageName:(NSString *)name
{
    return [[self imageNamed:name] circleImage];

}
@end
