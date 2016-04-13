//
//  UIButton+xh.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "UIButton+xh.h"

@implementation UIButton (xh)

- (void)xh_setBackgroundColor:(UIColor *)color forState:(UIControlState)state{
    [self setBackgroundImage:[UIImage xh_imageWithColor:color] forState:state];
}

@end
