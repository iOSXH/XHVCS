//
//  XHTest3ViewController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHTest3ViewController.h"

@implementation XHTest3ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.confDic = @{NAV_HIDDEN: @(YES),
                         NAV_LEFT_TITLE:@"test",
                         TAB_SHOW:@(NO)};
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

@end
