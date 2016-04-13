//
//  XHBaseTabBarController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHBaseTabBarController.h"
#import "XHBaseNavigationController.h"
#import "XHBaseViewController.h"

@interface XHBaseTabBarController ()

@end

@implementation XHBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    //去除 TabBar 自带的顶部阴影
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIViewController *vc = self.selectedViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController*)vc;
        vc = nav.visibleViewController;
    }

    //不支持旋转 强制竖屏
    BOOL ai = [((XHBaseViewController*)vc).confDic[VC_AI] boolValue];
    if (!ai) {
        [self forceChangeToOrientation:UIInterfaceOrientationPortrait];
    }
}

#pragma mark - 控制屏幕旋转
- (void)forceChangeToOrientation:(UIInterfaceOrientation)interfaceOrientation{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:interfaceOrientation] forKey:@"orientation"];
}

#pragma mark - 控制屏幕旋转

- (BOOL)shouldAutorotate{
    UIViewController *vc = self.selectedViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController*)vc;
        vc = nav.visibleViewController;
    }
    
    
    return [vc shouldAutorotate];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    UIViewController *vc = self.selectedViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController*)vc;
        vc = nav.visibleViewController;
    }
    return [vc preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    UIViewController *vc = self.selectedViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController*)vc;
        vc = nav.visibleViewController;
    }
    return [vc supportedInterfaceOrientations];
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
