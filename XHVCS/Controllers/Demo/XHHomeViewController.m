//
//  XHHomeViewController.m
//  XHVCS
//
//  Created by xianghui on 16/4/13.
//  Copyright © 2016年 XH. All rights reserved.
//

#import "XHHomeViewController.h"
#import "XHBaseNavigationController.h"
#import "XHTest1ViewController.h"
#import "XHTest2ViewController.h"

@implementation XHHomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    XHTest1ViewController *vc1 = [[XHTest1ViewController alloc] init];
    XHBaseNavigationController *nav1 = [[XHBaseNavigationController alloc] initWithRootViewController:vc1];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
//    item1.title = @"Test1";
//    [item1 setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor blackColor]} forState:UIControlStateSelected];
    nav1.tabBarItem = item1;
    [self addChildViewController:nav1];

    
    XHTest2ViewController *vc2 = [[XHTest2ViewController alloc] init];
    XHBaseNavigationController *nav2 = [[XHBaseNavigationController alloc] initWithRootViewController:vc2];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:2];
//    item2.title = @"Test2";
//    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor blackColor]} forState:UIControlStateSelected];
    nav2.tabBarItem = item2;
    [self addChildViewController:nav2];
    
}

@end
