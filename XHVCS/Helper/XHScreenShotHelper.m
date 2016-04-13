//
//  ScreenshotHelper.m
//  fake
//
//  Created by xianghui on 16/4/5.
//  Copyright © 2016年 xh. All rights reserved.
//

#import "XHScreenShotHelper.h"

@implementation XHScreenShotHelper


IMPLEMENT_SINGLETON(XHScreenShotHelper, sharedScreenShotHelper);

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addTakeScreenShotNotifition];//添加截屏通知监听
    }
    return self;
}


- (void)addTakeScreenShotNotifition{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(userDidTakeScreenshot:)
                                                 name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}


- (void)removeTakeScreenShotNotifition{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}



//截屏响应
- (void)userDidTakeScreenshot:(NSNotification *)notification
{
    XHLog(@"检测到截屏");
    
    //人为截屏, 模拟用户截屏行为, 获取所截图片
    UIImage *image_ = [self imageWithScreenshot];
    
    //添加显示
    UIImageView *imgvPhoto = [[UIImageView alloc]initWithImage:image_];
    imgvPhoto.frame = CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/4, SCREEN_WIDTH/2, SCREEN_WIDTH/2 * image_.size.height/image_.size.width);
    
    imgvPhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap:)];
    [imgvPhoto addGestureRecognizer:tap];
    
    //添加边框
//    CALayer * layer = [imgvPhoto layer];
//    layer.borderColor = [
//                         [UIColor blackColor] CGColor];
//    layer.borderWidth = 0.5f;
    //添加四个边阴影
    imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
    imgvPhoto.layer.shadowOffset = CGSizeMake(0, 0);
    imgvPhoto.layer.shadowOpacity = 0.5;
    imgvPhoto.layer.shadowRadius = 10.0;
    //添加两个边阴影
    imgvPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
    imgvPhoto.layer.shadowOffset = CGSizeMake(4, 4);
    imgvPhoto.layer.shadowOpacity = 0.5;
    imgvPhoto.layer.shadowRadius = 2.0;
    
    [[UIApplication sharedApplication].keyWindow addSubview:imgvPhoto];
}


-(void)imageViewDidTap:(UITapGestureRecognizer *)sender{
    [sender.view removeFromSuperview];
}



- (void)startScreenShot{
    [self userDidTakeScreenshot:nil];
}

/**
 *  @author xh, 16-04-05 15:04:49
 *
 *  截取详情屏幕
 *
 *  @return 图片Data
 */
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}

/**
 *  @author xh, 16-04-05 15:04:32
 *
 *  屏幕截图图片
 *
 *  @return 图片image
 */
- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
}

@end
