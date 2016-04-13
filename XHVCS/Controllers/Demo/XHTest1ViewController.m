//
//  XHTest1ViewController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHTest1ViewController.h"
#import "XHTest3ViewController.h"

@implementation XHTest1ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.confDic = @{NAV_HIDDEN: @(NO),
                         NAV_TITLE:@"test1",
                         NAV_RIGHT_TITLE:@"test",
                         TAB_SHOW:@(YES)};
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}


- (void)rightNavigationItemsDidClicked:(id)sender{
    XHTest3ViewController *vc = [[XHTest3ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
