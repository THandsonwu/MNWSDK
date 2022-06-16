//
//  AppleCommunication.h
//  AppleComm
//
//  Created by 谭志武 on 2022/5/27.
//

#import <Foundation/Foundation.h>
#import <MNWSDK/MNWSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppleCommunication : NSObject

+ (void)loginApple:(MNWSDKGetUserStateChangedHandler)handler;



@end

NS_ASSUME_NONNULL_END
