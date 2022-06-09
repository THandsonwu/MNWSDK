//
//  MNWToken.h
//  MNWSDK
//
//  Created by 谭志武 on 2022/5/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNWToken : NSObject

/// 登陆认证是否成功
@property (nonatomic, assign) BOOL success;

/// 聚合SDK唯一的用户id
@property (nonatomic, strong) NSString *userId;

/// 聚合登录的Token
@property (nonatomic, strong) NSString *unifiedToken;

/// 登录透传参数（例如后台返回的数据）
@property (nonatomic, strong) NSDictionary *extension;

@end

NS_ASSUME_NONNULL_END
