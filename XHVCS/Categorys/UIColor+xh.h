//
//  UIColor+xh.h
//  fake
//
//  Created by xianghui on 16/3/31.
//  Copyright © 2016年 xh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (xh)

/**
 *  @author XH, 16-04-13 09:04:07
 *
 *  24位色值转换
 *
 *  @param hexString 24位色值
 *
 *  @return 颜色
 */
+ (UIColor *) xh_colorWithHexString: (NSString *) hexString;

/**
 *  @author XH, 16-04-13 09:04:08
 *
 *  RGB颜色转换
 *
 *  @param red   red 0-255
 *  @param green green 0-255
 *  @param blue  blue 0-255
 *  @param alpha alpha 0-1
 *
 *  @return 颜色
 */
+ (UIColor *)xh_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  @author XH, 16-04-13 09:04:09
 *
 *  获取图片的颜色
 *
 *  @param point 图片中的位置
 *  @param image 图片
 *
 *  @return 颜色
 */
+ (UIColor*) xh_colorAtLocation:(CGPoint)point inImage:(UIImage *)image;


@end
