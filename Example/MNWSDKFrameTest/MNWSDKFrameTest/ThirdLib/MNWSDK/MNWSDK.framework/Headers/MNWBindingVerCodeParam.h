//
//  MNWBindingVerCodeParam.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/20.
//

#import <Foundation/Foundation.h>
#import "MNWSDKTypeDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface MNWBindingVerCodeParam : NSObject

/// 聚合账号
@property (nonatomic, strong, readonly) NSString *accountNum;

/// 手机号
@property (nonatomic, strong, readonly) NSString *phone;

/// 手机区号
@property (nonatomic, strong, readonly) NSString *phoneAreaCode;

/// 邮箱
@property (nonatomic, strong, readonly) NSString *email;

/// 发送绑定类型
@property (nonatomic, assign, readonly) MNWSendVerCodeType sendVerCodeType;


/// 绑定手机或者解绑手机获取验证码
/// @param account 聚合账号
/// @param type MNWSendVerCodeType_bind_phone || MNWSendVerCodeType_unbind_phone,
/// @param phone 手机号码
/// @param phoneAreaCode 手机区号
- (instancetype)initWithAccount:(NSString *)account sendVerCodeType:(MNWSendVerCodeType)type phone:(NSString *)phone phoneAreaCode:(NSString *)phoneAreaCode;

/// 绑定邮箱或者解绑邮箱获取验证码
/// @param account 聚合账号
/// @param type MNWSendVerCodeType_bind_email || MNWSendVerCodeType_unbind_email
/// @param email  邮箱
- (instancetype)initWithAccount:(NSString *)account sendVerCodeType:(MNWSendVerCodeType)type email:(NSString *)email;

@end

NS_ASSUME_NONNULL_END
