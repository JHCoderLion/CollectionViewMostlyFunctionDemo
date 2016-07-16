//
//  JHshowBigPictureController.h
//  支付宝
//
//  Created by 赖锦浩 on 16/4/29.
//  Copyright © 2016年 赖锦浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHshowBigPictureController : UICollectionViewController


/** block传值 */
@property (nonatomic, copy) void(^showBigPicture)(NSIndexPath *);

@end
