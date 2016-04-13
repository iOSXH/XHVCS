//
//  XHTest4ViewController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHTest4ViewController.h"

@implementation XHTest4ViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.confDic = @{NAV_HIDDEN: @(NO),
                         NAV_TITLE:@"test4",
                         NAV_LEFT_TITLE:@"test",
                         TAB_SHOW:@(NO),
                         VC_AI:@(YES)};
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

@end
