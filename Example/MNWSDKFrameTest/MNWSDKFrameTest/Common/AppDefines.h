//
//  AppDefines.h
//  sdksample
//
//  Created by mini1 on 2021/1/1.
//

#ifndef AppDefines_h
#define AppDefines_h

#import <UIKit/UIKit.h>

//0-开发环境，1-生产环境
#define SERVER_ENV_PROD 0

#if SERVER_ENV_PROD

    #define kCPID          @"ac5252e80ef7fe0a90e5c5ac7a9671d6"
    #define kProductKey    @"8733ee1263520df36e77637352200ef9"

#else

    #define kCPID          @"02411f31180988a05f3ea6b15b6fddfb"
    #define kProductKey    @"c84cb158cd0e4513f507735adddf68e4"

#endif

#define  kTermsOfService  @"https://www.mini1.cn/article/20190527/839.html"

#define  kPrivacyPolicy   @"https://www.mini1.cn/privacy_policy.html"

#define APP_ID      [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"]
#define APP_VERSION [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]
#define APP_BUILDID [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"]
#define APP_NAME    [NSBundle mainBundle].infoDictionary[@"CFBundleDisplayName"]

#define OS_VERSION    [[UIDevice currentDevice] systemVersion]

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/* 屏幕相关尺寸 */

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define IPHONE_X_SERIES \
({  BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define MJRefreshFooterBottom   (IPHONE_X_SERIES ? -10 : 0)

/** 顶部安全区域顶部高度 */
#define TOP_SAFE_SPACE \
({  CGFloat safeAreaInsetsTop = 0;\
if (@available(iOS 11.0, *)) {\
safeAreaInsetsTop = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.top;\
}\
(safeAreaInsetsTop);})

/** 底部安全区域远离高度 */
#define BOTTOM_SAFE_SPACE \
({  CGFloat safeAreaInsetsBottom = 0;\
if (@available(iOS 11.0, *)) {\
safeAreaInsetsBottom = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;\
}\
(safeAreaInsetsBottom);})

/** 状态栏高度 */
#define STATUSBAR_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)
/** 导航栏高度*/
#define NAVBAR_HEIGHT (44)
/** 状态栏和导航栏总高度*/
#define STATUSBAR_NAVBAR_HEIGHT (CGFloat)(STATUSBAR_HEIGHT + NAVBAR_HEIGHT)
/** TabBar高度*/
#define TABBAR_HEIGHT (CGFloat)(IPHONE_X_SERIES?(83.0):(49.0))
/** 导航条和Tabbar总高度*/
#define NAVBAR_TABBAR_HEIGHT (STATUSBAR_NAVBAR_HEIGHT + TABBAR_HEIGHT)

/** 颜色 */

#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define RGB(r, g, b)        RGBA((r), (g), (b), 1.0)

#define RGBAHex(rgb, a)     RGBA(((rgb) & 0xFF0000) >> 16, ((rgb) & 0xFF00) >> 8, (rgb) & 0xFF, (a))
#define RGBHex(rgb)         RGBAHex(rgb, 1.0)

/** 字体 */
#define Font(size)                      [UIFont systemFontOfSize:(size)]
#define FontLight(size)                 [UIFont systemFontOfSize:(size) weight:UIFontWeightLight]
#define FontMedium(size)                [UIFont systemFontOfSize:(size) weight:UIFontWeightMedium]
#define FontBold(size)                  [UIFont boldSystemFontOfSize:(size)]

/** 普通占位图 */
#define PLACEHOLDER_IMAGE [UIImage imageWithColor:RGB_LightGray]

/** iPhone5 适配比例 */
#define IPHONE5Scale(x)    (IPHONE_5 ? 320 * x / 375 : x)

#define MNNullString(str)       (![str isKindOfClass:[NSNull class]]) && ((NSString *)str).length > 0 ? str : @""
#define MNCheckNonNull(v) ((v) && ![(v) isEqual:[NSNull null]])
//毫秒级时间戳
#define kMSTimeInterval     (int64_t)([[NSDate date] timeIntervalSince1970] * 1000)
//秒级时间戳
#define kMESecTimeInterval     (int64_t)([[NSDate date] timeIntervalSince1970])

#endif /* AppDefines_h */
