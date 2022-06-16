//
//  GooglePlusCommunication.h
//  GooglePlusComm
//
//  Created by 谭志武 on 2022/5/28.
//

#import <Foundation/Foundation.h>

#import <MNWSDK/MNWSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface GooglePlusCommunication : NSObject

+ (void)registerClientId:(NSString *)ClientId;

+ (void)loginGoogle:(MNWSDKGetUserStateChangedHandler)handler;

+ (BOOL)handlerURL:(NSURL * _Nullable)url;

@end

NS_ASSUME_NONNULL_END
