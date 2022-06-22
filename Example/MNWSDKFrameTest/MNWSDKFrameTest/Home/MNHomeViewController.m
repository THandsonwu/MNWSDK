//
//  MNHomeViewController.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/18.
//

#import "MNHomeViewController.h"


@interface MNHomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *accountLB;
@property (weak, nonatomic) IBOutlet UILabel *userIDLB;
@property (weak, nonatomic) IBOutlet UILabel *tokenLB;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneVerTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *emailVerTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneAreaTF;

@property (weak, nonatomic) IBOutlet UIButton *bindPhoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *binEmailBtn;
@property (weak, nonatomic) IBOutlet UIButton *binFaceBookBtn;
@property (weak, nonatomic) IBOutlet UIButton *binGoogleBtn;
@property (weak, nonatomic) IBOutlet UIButton *binAppleBtn;

@property (nonatomic, assign) MNWSendVerCodeType phoneCodeType;

@property (nonatomic, assign) MNWSendVerCodeType emailCodeType;

@end

@implementation MNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.userIDLB.text = MNAccountManager.shareManager.userId;
    self.tokenLB.text = MNAccountManager.shareManager.token;
    self.accountLB.text = MNAccountManager.shareManager.account;
    self.phoneCodeType = MNWSendVerCodeType_bind_phone;
    self.emailCodeType = MNWSendVerCodeType_bind_email;
    
    [MNWSDK queryBindAccountInfoWithAccount:self.userIDLB.text completionHandler:^(MNWCode code, NSString * _Nullable msg, id  _Nullable responseObject) {
        if ([responseObject isDictionary] && [responseObject[@"thirdInfos"] isValidArray]) {
            for (NSDictionary *dict in responseObject[@"thirdInfos"]) {
                if ([dict[@"mergeChannelId"] integerValue] == 7606710) {
                    [self.binFaceBookBtn setTitle:@"解绑Facebook" forState:UIControlStateNormal];
                }
                if ([dict[@"mergeChannelId"] integerValue] == 7606712) {
                    [self.binGoogleBtn setTitle:@"解绑Google" forState:UIControlStateNormal];
                }
                if ([dict[@"mergeChannelId"] integerValue] == -2) {
                    self.phoneAreaTF.text = [dict[@"thirdUserName"] componentsSeparatedByString:@"#"].firstObject;
                    self.phoneTF.text = [dict[@"thirdUserName"] componentsSeparatedByString:@"#"].lastObject;
                    [self.bindPhoneBtn setTitle:@"解绑手机号" forState:UIControlStateNormal];
                    self.phoneCodeType = MNWSendVerCodeType_unbind_phone;
                }
                if ([dict[@"mergeChannelId"] integerValue] == -1) {
                    self.emailTF.text = dict[@"thirdUserName"];
                    [self.binEmailBtn setTitle:@"解绑邮箱" forState:UIControlStateNormal];
                    self.emailCodeType = MNWSendVerCodeType_unbind_email;
                }
            }
        }
    }];
}
#pragma mark -- 手机
- (IBAction)getPhoneVerifyCode:(UIButton *)sender {
    MNWBindingVerCodeParam *param = [[MNWBindingVerCodeParam alloc] initWithAccount:self.userIDLB.text sendVerCodeType:self.phoneCodeType phone:self.phoneTF.text phoneAreaCode:self.phoneAreaTF.text];
    [MNWSDK getBindAccountVerifyCode:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        //需要国外号码 验证OK
    }];
    
}
- (IBAction)binOrUnbinPhone:(UIButton *)sender {
    MNWBindAccoutParam *param = [[MNWBindAccoutParam alloc] initWithBindType:self.phoneCodeType accountNum:self.userIDLB.text verifyCode:@"123456"];
    [MNWSDK bindAccount:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        //验证OK
        if (code == MNWCode_PHONE_BIND_SUCCESS) {
            [sender setTitle:@"解绑手机号" forState:UIControlStateNormal];
            self.phoneCodeType = MNWSendVerCodeType_unbind_phone;
        } else if (MNWCode_PHONE_UNBIND_SUCCESS) {
            [sender setTitle:@"绑定手机号" forState:UIControlStateNormal];
            self.phoneCodeType = MNWSendVerCodeType_bind_phone;
        }
    }];
}
#pragma mark -- 邮箱
- (IBAction)getEmailVerifyCode:(id)sender {
    MNWBindingVerCodeParam *param = [[MNWBindingVerCodeParam alloc] initWithAccount:self.userIDLB.text sendVerCodeType:self.emailCodeType email:self.emailTF.text];
    [MNWSDK getBindAccountVerifyCode:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        //验证接口OK
        [self showToast:msg];
    }];
}
- (IBAction)binOrUnbinEmail:(UIButton *)sender {
    MNWBindAccoutParam *param = [[MNWBindAccoutParam alloc] initWithBindType:self.emailCodeType accountNum:self.userIDLB.text verifyCode:self.emailVerTF.text];
    [MNWSDK bindAccount:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        //验证OK
        [self showToast:msg];
        if (code == MNWCode_EMAIL_BIND_SUCCESS) {
            [sender setTitle:@"解绑邮箱" forState:UIControlStateNormal];
            self.emailCodeType = MNWSendVerCodeType_unbind_email;
        } else if (code == MNWCode_EMAIL_UNBIND_SUCCESS) {
            [sender setTitle:@"绑定邮箱" forState:UIControlStateNormal];
            self.emailCodeType = MNWSendVerCodeType_bind_email;
        }
    }];
}

#pragma mark -- 第三方
- (IBAction)binOrUnbinFacebook:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"绑定Facebook"]) {
        [MNWSDK thirdBindAccount:self.userIDLB.text bindType:MNWThirdBindTypeFaceBook onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_BIND_SUCCESS) {
                [sender setTitle:@"解绑Facebook" forState:UIControlStateNormal];
            }
        }];
    } else {
        [MNWSDK thirdUnBindAccount:self.userIDLB.text unBindType:MNWThirdBindTypeFaceBook onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_UNBIND_SUCCESS) {
                [sender setTitle:@"绑定Facebook" forState:UIControlStateNormal];
            }
        }];
    }
    
}
- (IBAction)binOrUnbinGoogle:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"绑定Google"]) {
        [MNWSDK thirdBindAccount:self.userIDLB.text bindType:MNWThirdBindTypeGoogle onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_BIND_SUCCESS) {
                [sender setTitle:@"解绑Google" forState:UIControlStateNormal];
            }
        }];
    } else {
        [MNWSDK thirdUnBindAccount:self.userIDLB.text unBindType:MNWThirdBindTypeGoogle onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_UNBIND_SUCCESS) {
                [sender setTitle:@"绑定Google" forState:UIControlStateNormal];
            }
        }];
    }
}
- (IBAction)binOrUnbinApple:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"绑定Apple"]) {
        [MNWSDK thirdBindAccount:self.userIDLB.text bindType:MNWThirdBindTypeApple onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_BIND_SUCCESS) {
                [sender setTitle:@"解绑Apple" forState:UIControlStateNormal];
            }
        }];
    } else {
        [MNWSDK thirdUnBindAccount:self.userIDLB.text unBindType:MNWThirdBindTypeApple onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
            if (code == MNWCode_UNBIND_SUCCESS) {
                [sender setTitle:@"绑定Apple" forState:UIControlStateNormal];
            }
        }];
    }
}


#pragma mark -- 退出登录

- (IBAction)logout:(id)sender {
    [MNWSDK logout:^(MNWCode code, NSString * _Nullable msg) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLoginUserID];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kLoginToken];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:kLogoutSucceedNotification object:nil];
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
