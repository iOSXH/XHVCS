//
//  XHBaseNavigationController.m
//  fake
//
//  Created by xianghui on 16/3/31.
//  Copyright © 2016年 xh. All rights reserved.
//

#import "XHBaseNavigationController.h"
#import "XHBaseViewController.h"
#import "XHBaseTabBarController.h"

@interface XHBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation XHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDelegate:self];
    [self customizeInterface];
}

- (void)customizeInterface {
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = self.navigationBar;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        [navigationBarAppearance setTintColor:[UIColor whiteColor]];//返回按钮的箭头颜色
        [[UITextField appearance] setTintColor:[UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]];//设置UITextField的光标颜色
        [[UITextView appearance] setTintColor:[UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]];//设置UITextView的光标颜色
        [[UISearchBar appearance] setBackgroundImage:[UIImage xh_imageWithColor:[UIColor blackColor]] forBarPosition:0 barMetrics:UIBarMetricsDefault];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
                           NSForegroundColorAttributeName: [UIColor whiteColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        [[UISearchBar appearance] setBackgroundImage:kImageNamed(@"common_nav_bg")];
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:20],
                           UITextAttributeTextColor: [UIColor COLOR_WHITE],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    [navigationBarAppearance setBackgroundImage:[UIImage xh_imageWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)])
        
    {
        
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
        
    }
//    navigationBarAppearance.translucent = NO;
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    
    if ([viewController isKindOfClass:[XHBaseViewController class]]) {
        XHBaseViewController *baseView = (XHBaseViewController *)viewController;
        NSDictionary *confDic = baseView.confDic;
        BOOL tabHidden = ![confDic[TAB_SHOW] boolValue];
        viewController.hidesBottomBarWhenPushed = tabHidden;
    }
    
    [super pushViewController:viewController animated:animated];
}


//- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
//
//    return [super popViewControllerAnimated:animated];
//}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    
    
    if (![viewController isKindOfClass:[XHBaseViewController class]]) {
        if ([viewController isKindOfClass:[XHBaseTabBarController class]]) {
            [viewController setFd_interactivePopDisabled:YES];
            [self setNavigationBarHidden:YES animated:NO];
        }
        if ([viewController isKindOfClass:[XHBaseNavigationController class]]) {
            viewController.fd_prefersNavigationBarHidden = YES;
            [self setNavigationBarHidden:YES animated:NO];
        }
        return;
    }
    
    
    
    XHBaseViewController *baseView = (XHBaseViewController *)viewController;
    NSDictionary *confDic = baseView.confDic;
    
    BOOL navHidden = [confDic[NAV_HIDDEN] boolValue];
    [self setNavigationBarHidden:navHidden animated:YES];
    
    if ([confDic.allKeys containsObject:SWIPE]) {
        BOOL swipe = [confDic[SWIPE] boolValue];
        baseView.fd_interactivePopDisabled = swipe;
    }
    
//    if ([confDic.allKeys containsObject:NAV_RIGHT] && [confDic.allKeys containsObject:NAV_RIGHT]) {
//        
//        
//    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
}


#pragma mark - 控制屏幕旋转
- (BOOL)shouldAutorotate{
    if (self.supportInterface) {
        return [self.visibleViewController shouldAutorotate];
    }else{
        return NO;
    }
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if (self.supportInterface) {
        return [self.visibleViewController preferredInterfaceOrientationForPresentation];
    }else{
        return UIInterfaceOrientationPortrait;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.supportInterface) {
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    if (self.supportInterface) {
        return [self.visibleViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    }else{
        return NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
