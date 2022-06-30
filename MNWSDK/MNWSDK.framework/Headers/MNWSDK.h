//
//  MNWSDK.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/16.
//

#import <Foundation/Foundation.h>
#import "MNWUser.h"
#import "MNWToken.h"
#import "MNWLoginParam.h"
#import "MNWSDKRegister.h"
#import "MNWVerCodeParam.h"
#import "MNWSDKTypeDefine.h"
#import "MNWBindAccoutParam.h"
#import "MNWBindingVerCodeParam.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNWSDK : NSObject

#pragma mark --- 注册/初始化接口

/// 注册聚合平台分发的appid和appkey
/// @param tenementId 聚合平台的appid
/// @param tenementKey 聚合平台的appkey
/// @param deviceId 唯一机器编码
+ (void)registerMNWSDKWithTenementId:(NSString *)tenementId tenementKey:(NSString *)tenementKey deviceId:(NSString *)deviceId;

/// 注册登录SDK，需要传入配置的各平台的AppId和AppKey,SecretKey 和universalLink等
/// @param platforms ...
+ (void)registerLoginPlatforms:(void(^_Nonnull)(MNWSDKRegister * _Nonnull platformsRegister))platforms;


/// 是否开启调试模式，会打印请求url，请求参数，还有返回数据
/// @param enableDebug 是否能调试（会切换测试环境）
+ (void)setEnableDebug:(BOOL)enableDebug;

/// 透传客户端额外的参数，作为请求的补充参数
/// @param extensionParams 额外参数的json 字符串
+ (void)setExtensionParams:(NSString *)extensionParams;

#pragma mark --- 聚合登录相关接口

/// 聚合登录接口
/// @param loginParam 登录参数对象，查看具体类型和实例化方法
/// @param onResult 请求结果回调
/// @param onLoginResult 如果第三方授权登录，则返回授权的信息
/// @param onAuthResult 聚合平台返回的token信息，具体内容可以查看token.extension
+ (void)loginWithMNWLoginParam:(MNWLoginParam *)loginParam onResult:(onResult _Nullable)onResult onLoginResult:(onLoginResult _Nullable)onLoginResult onAuthResult:(onAuthResult _Nonnull)onAuthResult;


/// 获取验证码
/// @param codeParam 验证码参数
/// @param onResult 是否获取成功回调
+ (void)getVerifyCode:(MNWVerCodeParam *)codeParam onResult:(onResult _Nullable)onResult;

/// 注册聚合平台通行证
/// 注册限制：同一个ip永久限制只能注册十个账号，同一设备号每天只能注册三个账号
/// @param account 通行证账号
/// @param password 通行证密码
/// @param onResult 注册是否成功回调
/// @param onAuthResult 用户信息回调
+ (void)registerAccountWithAccount:(NSString *)account password:(NSString *)password onResult:(onResult _Nullable)onResult onAuthResult:(onAuthResult _Nonnull)onAuthResult;

/// 快速通过手机号注册
/// @param phone 手机号
/// @param phoneAreaCode 区号
/// @param verifyCode 手机验证码
/// @param onResult 注册是否成功回调
/// @param onAuthResult 用户信息回调
+ (void)registerAccountWithPhone:(NSString *)phone phoneAreaCode:(NSString *)phoneAreaCode verifyCode:(NSString *)verifyCode onResult:(onResult _Nullable)onResult onAuthResult:(onAuthResult _Nonnull)onAuthResult;


/// 通行证密码获取验证码接口
/// @param account 通行证账号
/// @param resetWay 重置方式 MNWResetWayePhone 手机 MNWResetWayeEmail 邮箱
/// @param onResult 发送是否成功回调
+ (void)sendResetVerifyCodeWithAccount:(NSString *)account resetWay:(MNWResetWay)resetWay onResult:(onResult _Nullable)onResult;

/// 通信证账号重置密码接口
/// @param account 通行证账号
/// @param newPassword 新密码
/// @param verifyCode 验证码（手机或邮箱）
/// @param onResult 重置是否成功回调
+ (void)resetAccountWithAccount:(NSString *)account newPassword:(NSString *)newPassword verifyCode:(NSString *)verifyCode onResult:(onResult _Nullable)onResult;

/// 通行证设置新密码接口
/// @param account 通行证账号
/// @param password 密码
/// @param onResult 是否设置成功回调
+ (void)setPasswordForQuickRegisterWithAccount:(NSString *)account password:(NSString *)password onResult:(onResult _Nullable)onResult;


/// 查询第三方账号，邮箱，手机绑定列表
/// @param account 通行证账号
/// @param completionHandler 绑定信息回调
/// 返回这样的数据
/// {
///"thirdInfos": [
///  {
///    "mergeChannelId": -1,   ----- 7606710:Facebook ；7606712:Google ；7606715: Apple;  -1 ：email ; -2 : phone
///    "tenementId": 10870003,
///    "accountNum": "317006399371657219",
///    "thirdUserName": "1124634508@qq.com"
///  }]
///}
+ (void)queryBindAccountInfoWithAccount:(NSString *)account completionHandler:(void (^)(MNWCode code, NSString * _Nullable msg, id _Nullable responseObject))completionHandler;

/// 退出登录
/// @param onResult ...
+ (void)logout:(onResult _Nullable)onResult;

/// 文字密码验证问题对照表
/// @param lang 当前语言 "en"为英文, "zh"为中文，其它不支持
+ (NSArray *)securityQuestions:(NSString *)lang;

#pragma mark -- 绑定/解绑相关接口

/// 获取绑定账号验证码
/// @param codeParam bindingParam
/// @param onResult ...
+ (void)getBindAccountVerifyCode:(MNWBindingVerCodeParam *)codeParam onResult:(onResult _Nullable)onResult;

/// 绑定账号
/// @param bindParam bindAccountParam
/// @param onResult ...
+ (void)bindAccount:(MNWBindAccoutParam *)bindParam onResult:(onResult _Nullable)onResult;

/// 第三方授权账号绑定
/// @param account 通行证账号
/// @param bindType 绑定类型
/// @param onResult ...
+ (void)thirdBindAccount:(NSString *)account bindType:(MNWThirdBindType)bindType onResult:(onResult _Nullable)onResult;

/// 第三方授权账号解绑
/// @param account 通行证账号
/// @param unBindType 解绑类型
/// @param onResult ...
+ (void)thirdUnBindAccount:(NSString *)account unBindType:(MNWThirdBindType)unBindType onResult:(onResult _Nullable)onResult;


#pragma mark -- 海外专属

/// 迷你号或者邮箱发送验证码
/// @param uin 迷你号
/// @param email 邮箱账号
/// @param onResult ...
+ (void)sendResetVerifyCodeWithUin:(NSString *)uin email:(NSString *)email onResult:(onResult _Nullable)onResult;

/// 迷你号发送手机验证码（暂时弃用，后台逻辑未完善）
/// @param uin 迷你号
/// @param phone 手机号
/// @param phoneAreaCode 手机区号
/// @param onResult ...
+ (void)sendResetVerifyCodeWithUin:(NSString *)uin phone:(NSString *)phone phoneAreaCode:(NSString *)phoneAreaCode onResult:(onResult)onResult DEPRECATED_MSG_ATTRIBUTE("this service is not available ,don't used");

/// 迷你号或者邮箱验证验证码接口
/// @param uin 迷你号
/// @param email 邮箱
/// @param verifyCode 验证码
/// @param onResult ...
+ (void)validationAccountWithUin:(NSString *)uin email:(NSString *)email verifyCode:(NSString *)verifyCode onResult:(onResult _Nullable)onResult;

/// 重置迷你号或者邮箱账号密码
/// @param uin 迷你号
/// @param email 邮箱
/// @param newPassword 新密码
/// @param onResult ...
+ (void)resetAccountWithUin:(NSString *)uin email:(NSString *)email newPassword:(NSString *)newPassword onResult:(onResult _Nullable)onResult;


@end

NS_ASSUME_NONNULL_END
