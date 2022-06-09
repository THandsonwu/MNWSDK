//
//  MNAccountManager.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/19.
//

#import "MNAccountManager.h"

@interface MNAccountManager ()

@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *token;
@property (nonatomic, strong)NSString *account;
@property (nonatomic, assign) BOOL isLogined;

@end

@implementation MNAccountManager

+ (instancetype)shareManager {
    static MNAccountManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self getAccount];
    }
    return self;
}

- (void)getAccount {
    NSString *userId = [[NSUserDefaults standardUserDefaults] valueForKey:kLoginUserID];
    self.userId = userId;
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:kLoginToken];
    self.token = token;
    NSString *account = [[NSUserDefaults standardUserDefaults] valueForKey:kLoginAccount];
    self.account = account;
    if (token || userId) {
        self.isLogined = YES;
    }
}

- (NSString *)userId {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLoginUserID];
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLoginToken];
}

- (NSString *)account {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLoginAccount];
}

@end
