//
//  XHCommon.h
//  XHVCS
//
//  Created by xianghui on 16/4/12.
//  Copyright © 2016年 XH. All rights reserved.
//

#ifndef XHCommon_h
#define XHCommon_h


#define kScale ([UIScreen mainScreen].bounds.size.width)/320
#define StatusBar_HEIGHT 20  //状态栏高度
#define NavigationBar_HEIGHT 44  //导航条高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width) //屏幕宽度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏幕高度

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] //系统版本-float
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])   //系统版本-string
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0]) //系统语言

#define kWindow [[UIApplication sharedApplication] keyWindow]

#ifdef DEBUG
#   define XHLog(fmt, ...) NSLog((@"%s [XH %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define XHLog(...)
#endif

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif


//G－C－D
#define GCDBACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDMAIN(block) dispatch_async(dispatch_get_main_queue(),block)


#define kWS(weakSelf)          __weak __typeof(&*self)weakSelf = self;

#define kWeakObj(object) __weak typeof(object)

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#pragma mark - 是否为空或是[NSNull null]

#define kNotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define kIsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#pragma mark - 图片资源获取
#define kIMGFROMBUNDLE( X )     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@""]]
#define kImageNamed( X )         [UIImage imageNamed:X]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define DECLARE_SINGLETON(cls_name, method_name)\
+ (cls_name*)method_name;


#define IMPLEMENT_SINGLETON(cls_name, method_name)\
+ (cls_name *)method_name {\
static cls_name *method_name;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
method_name = [[cls_name alloc] init];\
});\
return method_name;\
}

#define L(s) NSLocalizedString((s), nil)

#define EMPTY_STRING(string) \
( [string isKindOfClass:[NSNull class]] || \
string == nil || [string isEqualToString:@""])

#define GET_STRING(string) (EMPTY_STRING(string) ? @"" : string)


#define OBJC_STRINGIFY(x) @#x
#define encodeObject(x) [aCoder encodeObject:x forKey:OBJC_STRINGIFY(x)]
#define decodeObject(x) x = [aDecoder decodeObjectForKey:OBJC_STRINGIFY(x)]
#define encodeBool(x) [aCoder encodeBool:x forKey:OBJC_STRINGIFY(x)]
#define decodeBool(x) x = [aDecoder decodeBoolForKey:OBJC_STRINGIFY(x)]
#define encodeInt(x) [aCoder encodeInt:x forKey:OBJC_STRINGIFY(x)]
#define decodeInt(x) x = [aDecoder decodeIntForKey:OBJC_STRINGIFY(x)]
#define encodeDouble(x) [aCoder encodeDouble:x forKey:OBJC_STRINGIFY(x)]
#define decodeDouble(x) x = [aDecoder decodeDoubleForKey:OBJC_STRINGIFY(x)]


#endif /* XHCommon_h */
