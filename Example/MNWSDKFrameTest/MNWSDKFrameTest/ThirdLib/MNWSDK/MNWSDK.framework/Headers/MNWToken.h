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

/// 后端返回的所有数据（例如后台返回的数据）
@property (nonatomic, strong) NSDictionary *extension;

/// 登录透传参数（如果有账号信息等，也都返回在此json中），后端原路返回
@property (nonatomic, strong) NSString *busiExt;

@end

NS_ASSUME_NONNULL_END
