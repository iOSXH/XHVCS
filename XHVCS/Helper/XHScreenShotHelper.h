//
//  XHScreenShotHelper.h
//  fake
//
//  Created by xianghui on 16/4/5.
//  Copyright © 2016年 xh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHScreenShotHelper : NSObject


DECLARE_SINGLETON(XHScreenShotHelper, sharedScreenShotHelper);

/**
 *  @author xh, 16-04-05 16:04:16
 *
 *  开始截图
 */
- (void)startScreenShot;

/**
 *  @author xh, 16-04-05 15:04:49
 *
 *  截取详情屏幕
 *
 *  @return 图片Data
 */
- (NSData *)dataWithScreenshotInPNGFormat;

/**
 *  @author xh, 16-04-05 15:04:32
 *
 *  屏幕截图图片
 *
 *  @return 图片image
 */
- (UIImage *)imageWithScreenshot;

@end
