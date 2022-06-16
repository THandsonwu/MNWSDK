//
//  MNWUser.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class MNWSDKCredential;

/**
 *  性别
 */
typedef NS_ENUM(NSUInteger, MNWSDKGender)
{
    /**
     *  男
     */
    MNWSDKGenderMale      = 0,
    /**
     *  女
     */
    MNWSDKGenderFemale    = 1,
    /**
     *  未知
     */
    MNWSDKGenderUnknown   = 2,
};
@interface MNWUser : NSObject

/// 第三方登录的账号昵称
@property (nonatomic, strong) NSString *nickname;

/// 第三方登录的账号头像
@property (nonatomic, strong) NSString *icon;

///第三方登录账号的性别
@property (nonatomic, assign) MNWSDKGender gender;

/// 授权信息
@property (nonatomic, strong) MNWSDKCredential *credential;

@end

@interface MNWSDKCredential : NSObject

/// 授权uid
@property (nonatomic, strong) NSString *uid;

/// 授权token
@property (nonatomic, strong) NSString *token;

/// 原始数据
@property (nonatomic, strong) NSDictionary *rawData;

@end


NS_ASSUME_NONNULL_END
