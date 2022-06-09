//
//  MNAccountManager.h
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNAccountManager : NSObject
+ (instancetype)shareManager;

@property (nonatomic, strong, readonly)NSString *userId;
@property (nonatomic, strong, readonly)NSString *token;
@property (nonatomic, strong, readonly)NSString *account;
@property (nonatomic, assign, readonly)BOOL isLogined;



@end

NS_ASSUME_NONNULL_END
