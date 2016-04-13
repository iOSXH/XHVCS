//
//  XHTest2ViewController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHTest2ViewController.h"
#import "XHTest4ViewController.h"

@implementation XHTest2ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.confDic = @{NAV_HIDDEN: @(NO),
                         NAV_TITLE:@"test2",
                         NAV_LEFT_TITLE:@"test",
                         TAB_SHOW:@(YES)};
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)leftNavigationItemsDidClicked:(id)sender{
    XHTest4ViewController *vc = [[XHTest4ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
