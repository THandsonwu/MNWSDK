//
//  FacebookCommunication.h
//  FacebookComm
//
//  Created by 谭志武 on 2022/5/26.
//

#import <Foundation/Foundation.h>
#import <MNWSDK/MNWSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface FacebookCommunication : NSObject


+ (void)registerPlatform:(NSDictionary *)dict;

+ (void)loginFacebook:(MNWSDKGetUserStateChangedHandler)handler;

@end

NS_ASSUME_NONNULL_END
