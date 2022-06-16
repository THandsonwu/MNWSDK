//
//  AppDelegate.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/17.
//

#import "AppDelegate.h"
#import <MNWSDK/MNWSDK.h>
#import "MNNavigationController.h"
#import "MNLoginViewController.h"
#import "MNHomeViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>




@interface AppDelegate ()

@end

@implementation AppDelegate

//cn.mini1.MNWSDKFrameTest 135193995470-ajo0t4pkm1sn9r6q73n812j0vvfkvv4n.apps.googleusercontent.com
//10870003 5voia6l2amee816i6zxonlgkhmerfd4o
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [MNWSDK setEnableDebug:YES];
    [MNWSDK registerMNWSDKWithTenementId:@"10870003" tenementKey:@"5voia6l2amee816i6zxonlgkhmerfd4o" deviceId:[DeviceUtils deviceId]];
    

    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    //499909370349330  d331c2172a6968644127fccd87a9ffe8
    [MNWSDK registerLoginPlatforms:^(MNWSDKRegister * _Nonnull platformsRegister) {
        [platformsRegister setupFacebookLoginWithAppkey:@"xxxxxxxxxx你申请的Facebook的key" appSecret:@"xxxxxxxxxx你申请的Facebook的secret" displayName:@"MNWSDK"];
        [platformsRegister setupGoogleLoginByClientID:@"135193995470-ajo0t4pkm1sn9r6q73n812j0vvfkvv4n.apps.googleusercontent.com" clientSecret:@"" redirectUrl:@"http://localhost"];
       
    }];
   

//    [MobSDK registerAppKey:@"33d84f53d313e" appSecret:@"0a8b1b5cf99302cfce6b62167639497f"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if (@available(iOS 13.0, *)) {
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
    [self.window makeKeyAndVisible];
    
    if (MNAccountManager.shareManager.isLogined) {
        MNHomeViewController *vc = [MNHomeViewController new];
        self.window.rootViewController = [[MNNavigationController alloc] initWithRootViewController:vc];
    } else {
        MNLoginViewController *vc = [MNLoginViewController new];
        self.window.rootViewController = [[MNNavigationController alloc] initWithRootViewController:vc];
    }
    [self customUIComponentAppearance];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLoginSucceed:) name:kLoginSucceedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLogoutSucceed:) name:kLogoutSucceedNotification object:nil];
   
    
    return YES;
}

- (void)customUIComponentAppearance {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setFadeInAnimationDuration:0];
    
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [UINavigationBar appearance].tintColor = [UIColor blackColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UINavigationBar appearance].titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: FontBold(17) };
    
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    
    if (@available(iOS 13.0, *)) {
        [UIScrollView appearance].automaticallyAdjustsScrollIndicatorInsets = NO;
    }
}

- (void)onLoginSucceed:(NSNotification *)noti {
    MNHomeViewController *vc = [MNHomeViewController new];
    self.window.rootViewController = [[MNNavigationController alloc] initWithRootViewController:vc];
}

- (void)onLogoutSucceed:(NSNotification *)noti {
    MNLoginViewController *vc = [MNLoginViewController new];
    self.window.rootViewController = [[MNNavigationController alloc] initWithRootViewController:vc];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    if ([url.scheme isEqualToString:@"mno"] && [url.host containsString:@"miniworldplus.com"]) {
        NSArray *array = [url.query componentsSeparatedByString:@"&"];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [array enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isNotEmpty]) {
                NSArray *array = [obj componentsSeparatedByString:@"="];
                if (array.count >= 2) {
                    dict[array[0]] = array[1];
                }
            }
        }];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kGameAuthLoggedInNotification object:dict];
        
        return YES;
    } else {
        //googleHandler
        if ([url.absoluteString containsString:@"135193995470-ajo0t4pkm1sn9r6q73n812j0vvfkvv4n.apps.googleusercontent.com"]) {
            return [[GIDSignIn sharedInstance] handleURL:url];
        }
        //FacebookHandler
        if (@available(iOS 9.0, *)) {
            return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
        }
        return YES;
    }
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
