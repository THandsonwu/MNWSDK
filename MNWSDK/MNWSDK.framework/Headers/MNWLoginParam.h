//
//  MNWLoginParam.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/16.
//

#import <Foundation/Foundation.h>
#import "MNWSDKTypeDefine.h"

@interface MNWLoginParam : NSObject

/// 登录类型，必填
@property (nonatomic, assign, readonly) MNWLoginType loginType;

/// 登录手机号
@property (nonatomic, strong, readonly) NSString *phone;

/// 登录验证码，手机验证码或者邮箱验证码
@property (nonatomic, strong, readonly) NSString *verifyCode;

/// 手机区号
@property (nonatomic, strong, readonly) NSString *phoneAreaCode;

/// 账号名称
@property (nonatomic, strong, readonly) NSString *accountNum;

/// 账号密码
@property (nonatomic, strong, readonly) NSString *passWord;

/// 注册邮箱
@property (nonatomic, strong, readonly) NSString *email;

/// 文字密码问题Id
@property (nonatomic, strong, readonly) NSString *securityQuestionId;

/// 文字密码答案
@property (nonatomic, strong, readonly) NSString *answer;

//- (instancetype)init NS_UNAVAILABLE;
//+ (instancetype)new NS_UNAVAILABLE;


/// 第三方登录或者快速注册，只需要类型
/// @param loginType 登录类型
- (instancetype)initWithLoginType:(MNWLoginType)loginType;

/// 手机登录构造方法
/// @param loginType .MNWLoginTypePhone
/// @param phone 手机号码
/// @param phoneAreaCode 手机区号
/// @param verifyCode 手机验证码
- (instancetype)initWithLoginType:(MNWLoginType)loginType phone:(NSString *)phone phoneAreaCode:(NSString *)phoneAreaCode verifyCode:(NSString *)verifyCode;

/// 账号密码登录方式
/// @param loginType .MNWLoginTypeNewAccount || MNWLoginTypeOldAccount
/// @param accountNum 账号名称
/// @param passWord 账号密码
- (instancetype)initWithLoginType:(MNWLoginType)loginType accountNum:(NSString *)accountNum passWord:(NSString *)passWord;

/// 邮箱登录方式
/// @param loginType .MNWLoginTypeEmail
/// @param email 邮箱账号
/// @param verifyCode 邮箱验证码
- (instancetype)initWithLoginType:(MNWLoginType)loginType email:(NSString *)email verifyCode:(NSString *)verifyCode;

/// 旧迷你号，邮箱账号登录方式
/// @param loginType .MNWLoginTypeOldAccountQuestion
/// @param accountNum 旧账号名称，或者旧邮箱账号
/// @param securityQuestionId 密码验证问题Id
/// @param answer 密码验证答案
- (instancetype)initWithLoginType:(MNWLoginType)loginType accountNum:(NSString *)accountNum securityQuestion:(NSString *)securityQuestionId answer:(NSString *)answer;

@end

