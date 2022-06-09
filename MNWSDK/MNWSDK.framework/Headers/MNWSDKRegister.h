//
//  MNWSDKRegister.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNWSDKRegister : NSObject


/// 设置Google的注册信息
/// @param clientId clientId
/// @param clientSecret clientSecret 填@“”
/// @param redirectUrl 默认填 @“http://localhost"
- (void)setupGoogleLoginByClientID:(NSString *)clientId
                     clientSecret:(NSString * _Nullable)clientSecret
                      redirectUrl:(NSString * _Nullable)redirectUrl;

/// 设置Facebook的注册信息
/// @param appkey appkey
/// @param appSecret appSecret
/// @param displayName @“your app DisplayName”
- (void)setupFacebookLoginWithAppkey:(NSString *)appkey
                      appSecret:(NSString *)appSecret
                    displayName:(NSString *)displayName;



@end

NS_ASSUME_NONNULL_END
