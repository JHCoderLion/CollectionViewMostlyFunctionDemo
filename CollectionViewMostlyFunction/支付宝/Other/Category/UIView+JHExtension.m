//
//  UIView+JHExtension.m
//  Lion - baisi
//
//  Created by 赖锦浩 on 16/3/17.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import "UIView+JHExtension.h"

@implementation UIView (JHExtension)

- (void)setX:(CGFloat)x
{
    CGRect fram = self.frame;
    fram.origin.x = x;
    self.frame = fram;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect fram = self.frame;
    fram.origin.y = y;
    self.frame = fram;
}


- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
@end
