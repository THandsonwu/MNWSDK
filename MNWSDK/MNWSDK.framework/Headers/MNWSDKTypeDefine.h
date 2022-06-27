//
//  MNWSDKTypeDefine.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/16.
//

#ifndef MNWSDKTypeDefine_h
#define MNWSDKTypeDefine_h

typedef NS_ENUM(NSUInteger, MNWLoginType) {
    /// 快速注册/游客登录
    MNWLoginTypeQuickRegAccount,
    /// Facebook授权登录
    MNWLoginTypeFaceBook,
    /// Google授权登录
    MNWLoginTypeGoogle,
    /// 苹果登录
    MNWLoginTypeApple,
    /// 手机号码登录
    MNWLoginTypePhone,
    /// 邮箱登录
    MNWLoginTypeEmail,
    /// 通行证账号登录
    MNWLoginTypeNewAccount,
    /// 旧迷你号账号登录
    MNWLoginTypeOldAccount,
    /// 旧迷你号，密码问题登录
    MNWLoginTypeOldAccountQuestion,
};

typedef NS_ENUM(NSUInteger, MNWThirdBindType) {
    /// 第三方授权绑定/解绑Facebook
    MNWThirdBindTypeFaceBook,
    /// 第三方授权绑定/解绑Google
    MNWThirdBindTypeGoogle,
    /// 第三方授权绑定/解绑Apple
    MNWThirdBindTypeApple,
};

typedef NS_ENUM(NSUInteger, MNWVerCodeType) {
    /// 获取手机验证码
    MNWVerCodeTypePhoneVerCode = 1,
    /// 重置密码获取验证码
    MNWVerCodeTypeResetPasswordVerCode,
    /// 获取邮箱验证码
    MNWVerCodeTypeEmailVerCode,
 
};

typedef NS_ENUM(NSUInteger, MNWResetWay) {
    /// 重置密码手机方式
    MNWResetWayPhone = 1,
    /// 重置密码邮箱方式
    MNWResetWayEmail,
};

typedef NS_ENUM(NSUInteger, MNWSendVerCodeType) {
    /// 绑定手机获取验证码
    MNWSendVerCodeType_bind_phone = 1,
    /// 解绑手机获取验证码
    MNWSendVerCodeType_unbind_phone = 2,
    /// 绑定邮箱获取验证码
    MNWSendVerCodeType_bind_email = 3,
    /// 解绑邮箱获取验证码
    MNWSendVerCodeType_unbind_email = 4,
};


typedef NS_ENUM(NSUInteger, MNWCode) {
    /// 没有网络链接
    MNWCode_NO_NETWORK = 0,
    /// 初始化成功
    MNWCode_INIT_SUCCESS = 1,
    /// 初始化失败
    MNWCode__INIT_FAIL = 2,
    /// 没有初始化
    MNWCode_UNINIT = 3,
    /// 登录成功
    MNWCode_LOGIN_SUCCESS = 4,
    /// 登录失败
    MNWCode_LOGIN_FAIL = 5,
    /// 登录超时
    MNWCode_LOGIN_TIMEOUT = 6,
    /// 没有登录
    MNWCode_UNLOGIN = 7,
    /// 登出成功
    MNWCode_LOGOUT_SUCCESS = 8,
    /// 登出失败
    MNWCode_LOGOUT_FAIL = 9,
    /// 支付成功
    MNWCode_PAY_SUCCESS = 10,
    /// 支付失败
    MNWCode_PAY_FAIL = 11,
    /// 参数错误
    MNWCode_PARAM_ERROR = 21,
    /// 参数不全
    MNWCode_PARAM_NOT_COMPLETE = 22,
    /// 分享成功
    MNWCode_SHARE_SUCCESS = 23,
    /// 分享失败
    MNWCode_SHARE_FAILED = 24,
    /// 更新成功
    MNWCode_UPDATE_SUCCESS = 25,
    /// 更新失败
    MNWCode_UPDATE_FAILED = 26,
    /// 实名注册成功
    MNWCode_REAL_NAME_REG_SUCCESS = 27,
    /// 实名注册失败
    MNWCode_REAL_NAME_REG_FAILED = 28,
    /// 防沉迷查询结果
    MNWCode_ADDICTION_ANTI_RESULT = 29,
    /// 广播进入
    MNWCode_BROADCAST_RECEIVER_ENTRY = 30,
    /// 发送验证码成功
    MNWCode_SEND_VER_CODE_SUCCESS = 32,
    /// 发送验证码失败
    MNWCode_SEND_VER_CODE_FAILED = 33,
    /// 重置密码成功
    MNWCode_REST_PASSWORD_SUCCESS = 34,
    /// 重置密码失败
    MNWCode_REST_PASSWORD_FAILED = 35,
    /// 账号注册成功
    MNWCode_REGISTER_ACCOUNT_SUCCESS = 36,
    /// 账号注册失败
    MNWCode_REGISTER_ACCOUNT_FAILED = 37,
    /// 平台自有账号登录成功
    MNWCode_OWN_ACCOUNT_LOGIN_SUCCESS = 38,
    /// 平台自有账号登录失败
    MNWCode_OWN_ACCOUNT_LOGIN_FAILED = 39,
    /// 平台自有账号秒验预登录成功
    MNWCode_MIAO_YAN_PRE_LOGIN_SUCCESS = 40,
    /// 平台自有账号秒验预登录失败
    MNWCode_MIAO_YAN_PRE_LOGIN_FAILED = 41,
    /// 手机号、邮箱获取绑定或解绑验证码失败
    MNWCode_GET_BIND_OR_NOT_VCODE_FAILED = 42,
    /// 手机号、邮箱获取绑定或解绑验证码成功
    MNWCode_GET_BIND_OR_NOT_VCODE_SUCCESS = 43,
    /// 手机号绑定失败
    MNWCode_PHONE_BIND_FAILED = 44,
    /// 手机号绑定成功
    MNWCode_PHONE_BIND_SUCCESS = 45,
    /// 手机号解绑失败
    MNWCode_PHONE_UNBIND_FAILED = 46,
    /// 手机号解绑成功
    MNWCode_PHONE_UNBIND_SUCCESS = 47,
    /// 邮箱绑定失败
    MNWCode_EMAIL_BIND_FAILED = 48,
    /// 邮箱绑定成功
    MNWCode_EMAIL_BIND_SUCCESS = 49,
    /// 邮箱解绑失败
    MNWCode_EMAIL_UNBIND_FAILED = 50,
    /// 邮箱解绑成功
    MNWCode_EMAIL_UNBIND_SUCCESS = 51,
    /// 第三方绑定失败
    MNWCode_BIND_FAILED = 52,
    /// 第三方绑定成功
    MNWCode_BIND_SUCCESS = 53,
    /// 第三方解绑失败
    MNWCode_UNBIND_FAILED = 54,
    /// 第三方解绑成功
    MNWCode_UNBIND_SUCCESS = 55,
    /// 快速注册设置密码失败
    MNWCode_QUICK_REG_SET_PW_FAILED = 56,
    /// 快速注册设置密码成功
    MNWCode_QUICK_REG_SET_PW_SUCCESS = 57,
    /// 查询聚合账号绑定关系失败
    MNWCode_QUERY_ACCOUNT_BIND_FAILED = 58,
    /// 查询聚合账号绑定关系成功
    MNWCode_QUERY_ACCOUNT_BIND_SUCCESS = 59,
    /// 验证码验证失败
    MNWCode_VERIFY_CODE_FAILED = 60,
    /// 验证码验证成功
    MNWCode_VERIFY_CODE_SUCCESS = 61,
    /// 第三方取消授权
    MNWCode_THIRD_AUTHOR_CANCEL = 666,
    /// 成功
    MNWCode_DEFAULT_SUCCESS = 200,
    /// 失败
    MNWCode_DEFAULT_FAILED = 404,
    /// 平台鉴权失败
    MNWCode_AUTHENTICATION_FAILED = 401,

};

/**
 *  回调状态
 */
typedef NS_ENUM(NSUInteger, MNWSDKResponseState){
    
    /**
     *  开始
     */
    MNWSDKResponseStateBegin      = 0,
    
    /**
     *  成功
     */
    MNWSDKResponseStateSuccess    = 1,
    
    /**
     *  失败
     */
    MNWSDKResponseStateFail       = 2,
    
    /**
     *  MNWSDK取消
     */
    MNWSDKResponseStateCancel     = 3,
    
    /**
     *  平台取消
     */
    MNWSDKResponseStatePlatformCancel     = 5,
};
    
@class MNWUser, MNWToken;

/**
 *  用户请求回调
 *
 *  @param code  回调码
 *  @param msg  回调信息
 */
typedef void(^onResult)(MNWCode code, NSString * _Nullable msg);

/**
 *  获取用户登录第三方成功回调
 *
 *  @param user  用户第三方信息
 */
typedef void(^onLoginResult)(MNWUser * _Nullable user);

/**
 *  获取用户平添鉴权成功回调
 *
 *  @param token 用户token信息
 */
typedef void(^onAuthResult)(MNWToken * _Nullable token);

/**
 *  获取用户状态变更回调处理器
 *
 *  @param state 状态
 *  @param user  用户信息，当且仅当state为MNWSDKResponseStateSuccess时返回
 *  @param error 错误信息，当且仅当state为MNWSDKResponseStateFail时返回
 */
typedef void(^MNWSDKGetUserStateChangedHandler) (MNWSDKResponseState state, MNWUser * _Nullable user, NSError * _Nullable error);



#endif /* MNWSDKTypeDefine_h */
