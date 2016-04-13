//
//  UIButton+xh.h
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (xh)

/**
 *  @author XH, 16-04-13 10:04:10
 *
 *  设置各种状态下的背景颜色
 *
 *  @param color 背景颜色
 *  @param state 按钮状态
 */
- (void)xh_setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
