//
//  UIImage+xh.h
//  fake
//
//  Created by xianghui on 16/3/31.
//  Copyright © 2016年 xh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (xh)

/**
 *  @author XH, 16-04-13 09:04:47
 *
 *  颜色转换为图片
 *
 *  @param aColor 颜色
 *
 *  @return 图片数据
 */
+(UIImage *)xh_imageWithColor:(UIColor *)aColor;

@end
