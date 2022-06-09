//
//  MNWVerCodeParam.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/18.
//

#import <Foundation/Foundation.h>
#import "MNWSDKTypeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNWVerCodeParam : NSObject

/// 获取验证码类型，必填
@property (nonatomic, assign, readonly) MNWVerCodeType codeType;

/// 手机号
@property (nonatomic, strong, readonly) NSString *phone;

/// 手机区号
@property (nonatomic, strong, readonly) NSString *phoneAreaCode;

/// 邮箱
@property (nonatomic, strong, readonly) NSString *email;

/// 手机或者邮箱重置密码获取验证码时必填
@property (nonatomic, assign, readonly) MNWResetWay resetWay;



/// 获取手机验证码
/// @param codeType MNWVerCodeTypePhoneVerCode
/// @param phone 手机号
/// @param phoneAreaCode 手机区号
- (instancetype)initWithCodeType:(MNWVerCodeType)codeType phone:(NSString *)phone phoneAreaCode:(NSString *)phoneAreaCode;

/// 获取邮箱验证码
/// @param codeType MNWVerCodeTypeEmailVerCode
/// @param email 邮箱号
- (instancetype)initWithCodeType:(MNWVerCodeType)codeType email:(NSString *)email;

/// 手机或者邮箱找回密码验证码
/// @param codeType MNWVerCodeTypeResetPasswordVerCode
/// @param resetWay 1：手机， 2：邮箱
/// @param phone 手机号
/// @param email 邮箱号
- (instancetype)initWithCodeType:(MNWVerCodeType)codeType resetWay:(MNWResetWay)resetWay phone:(NSString * _Nullable)phone phoneAreaCode:(NSString *_Nullable)phoneAreaCode email:(NSString *_Nullable)email;

@end

NS_ASSUME_NONNULL_END
