//
//  XHBaseViewController.h
//  fake
//
//  Created by xianghui on 16/3/31.
//  Copyright © 2016年 xh. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString* const NAV_HIDDEN       =@"NavHidden";     //导航条是否隐藏
static NSString* const NAV_TITLE        =@"NavTitle";      //导航条title
static NSString* const NAV_LEFT         =@"NavLeft";       //导航条左按钮
static NSString* const NAV_RIGHT        =@"NavRight";      //导航条右按钮
static NSString* const NAV_LEFT_TITLE   =@"NavLeftTitle";  //导航条左按钮
static NSString* const NAV_RIGHT_TITLE  =@"NavRightTitle"; //导航条右按钮
static NSString* const NAV_ALPHA        =@"NavAlpha";      //导航条透明度
static NSString* const TAB_SHOW       =@"TabShow";      //tabbar是否显示
static NSString* const SWIPE            =@"Swipe";         //是否支持手势返回 yes 不支持

static NSString* const VC_AI                   =@"VC_AI";             //视图是否自动旋转 yes：自动



@interface XHBaseViewController : UIViewController

/**
*  @author XH, 16-04-12 18:04:49
*
 *  描述:
 配置属性  需要在初始化时设置 如init方法中设置
 内容:
 confDic : @{
 NAV_HIDDEN:@(),    //是否隐藏导航条
 NAV_TITLE:@(),     //导航条title
 NAV_LEFT_BTN:@(),  //导航条左按钮
 NAV_RIGHT_BTN:@()  //导航条右按钮
 TAB_HIDDEN:@(),    //tabbar是否隐藏
 }

*/
@property (nonatomic, strong) NSDictionary *confDic;

/**
 *  @author xh, 16-04-05 15:04:54
 *
 *  重置导航条左右按钮标题 参数为空时清空
 *
 *  @param lTitle 左标题
 *  @param rTitle 右标题
 */
-(void)resetNavigationItemsWithLeftTitle:(NSString *)lTitle rightTitle:(NSString *)rTitle;

-(void)resetNavigationItemsWithLeftView:(UIView *)lview rightView:(UIView *)rView;

/**
 *  @author xh, 16-04-05 15:04:59
 *
 *  左右导航按钮被点击  子类可重构
 *
 *  @param sender sender
 */
-(void)leftNavigationItemsDidClicked:(id)sender;
-(void)rightNavigationItemsDidClicked:(id)sender;

/**
 *  @author XH, 16-04-12 18:04:36
 *
 *  加载动画开始和结束
 */
-(void)startLoading;
-(void)stopLoading;

/**
 *  @author XH, 16-04-12 18:04:15
 *
 *  显示提示 2秒后消失
 *
 *  @param message 提示内容
 */
-(void)showToast:(NSString *)message;


/**
 *  @author XH, 16-04-12 18:04:43
 *
 *  强制设备旋转
 *
 *  @param interfaceOrientation 旋转方向
 */
- (void)forceChangeToOrientation:(UIInterfaceOrientation)interfaceOrientation;
@end
