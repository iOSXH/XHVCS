//
//  XHBaseViewController.m
//  fake
//
//  Created by xianghui on 16/3/31.
//  Copyright © 2016年 xh. All rights reserved.
//

#import "XHBaseViewController.h"

#import "XHScreenShotHelper.h"

@interface XHBaseViewController ()

@end

@implementation XHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initWithConfDic];
    
    // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    // 并让自己成为第一响应者
    [self becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //不支持旋转 强制竖屏
    BOOL ai = [self.confDic[VC_AI] boolValue];
    if (!ai) {
        [self forceChangeToOrientation:UIInterfaceOrientationPortrait];
    }
}



- (void)dealloc{
    //销毁时统一移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  @author XH, 16-04-13 09:04:34
 *
 *  初始化配置数据
 */
- (void)initWithConfDic{
    BOOL navHidden = [self.confDic[NAV_HIDDEN] boolValue];
    self.fd_prefersNavigationBarHidden = navHidden;
    
    if ([self.confDic.allKeys containsObject:NAV_TITLE]) {
        NSString *title = self.confDic[NAV_TITLE];
        [self setTitle:title];
    }
    NSString *leftTitle = @"";
    NSString *rightTitle = @"";
    if ([self.confDic.allKeys containsObject:NAV_LEFT_TITLE]){
        leftTitle = self.confDic[NAV_LEFT_TITLE];
    }
    
    if ([self.confDic.allKeys containsObject:NAV_RIGHT_TITLE]){
        rightTitle = self.confDic[NAV_RIGHT_TITLE];
    }
    [self resetNavigationItemsWithLeftTitle:leftTitle rightTitle:rightTitle];
}

#pragma mark NavigationItems
- (void)resetNavigationItemsWithLeftTitle:(NSString *)lTitle rightTitle:(NSString *)rTitle{
    if (lTitle && lTitle.length>0) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:lTitle style:UIBarButtonItemStylePlain target:self action:@selector(leftNavigationItemsDidClicked:)];
    }else{
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    if (rTitle && rTitle.length>0) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:rTitle style:UIBarButtonItemStylePlain target:self action:@selector(rightNavigationItemsDidClicked:)];
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)resetNavigationItemsWithLeftView:(UIView *)lview rightView:(UIView *)rView{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;

    if (lview) {
        
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:lview]];
        if ([lview isKindOfClass:[UIButton class]]) {
            UIButton *lButton = (UIButton *)lview;
            [lButton addTarget:self action:@selector(leftNavigationItemsDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }else{
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    if (rView) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rView];
        if ([rView isKindOfClass:[UIButton class]]) {
            UIButton *rButton = (UIButton *)rView;
            [rButton addTarget:self action:@selector(rightNavigationItemsDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)leftNavigationItemsDidClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightNavigationItemsDidClicked:(id)sender{
    
}


#pragma mark loading 
- (void)startLoading{
    [self.view makeToastActivity:CSToastPositionCenter];
//    [self.view setUserInteractionEnabled:NO];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)stopLoading{
    [self.view hideToastActivity];
    
//    [self.view setUserInteractionEnabled:YES];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma Mark toast
- (void)showToast:(NSString *)message{
    [self.view makeToast:message duration:2 position:CSToastPositionCenter];
}

#pragma mark - 摇一摇相关方法
// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    XHLog(@"开始摇动");
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    XHLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        XHLog(@"摇动结束");
        
        UIActionSheet *actionSheet = [UIActionSheet bk_actionSheetWithTitle:@"截图"];
        [actionSheet bk_addButtonWithTitle:@"全屏截图" handler:nil];
        [actionSheet bk_setCancelButtonWithTitle:@"" handler:nil];
        [actionSheet bk_setDidDismissBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
            if (buttonIndex==0) {
                [[XHScreenShotHelper sharedScreenShotHelper] startScreenShot];
            }
        }];
        [actionSheet showInView:self.view];
    }
    return;
}




#pragma mark - 控制屏幕旋转
- (void)forceChangeToOrientation:(UIInterfaceOrientation)interfaceOrientation{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:interfaceOrientation] forKey:@"orientation"];
}


- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    BOOL ai = [self.confDic[VC_AI] boolValue];
    if (ai) {
        return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationPortrait | UIInterfaceOrientationLandscapeRight;
    }
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate
{
    BOOL ai = [self.confDic[VC_AI] boolValue];
    if (ai) {
        return YES;
    }
    return NO;
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    BOOL ai = [self.confDic[VC_AI] boolValue];
    if (ai) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    BOOL ai = [self.confDic[VC_AI] boolValue];
    if (ai) {
        return YES;
    }
    return NO;
    
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
