//
//  MNLoginViewController.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/18.
//

#import "MNLoginViewController.h"
#import "MNSMSLoginViewController.h"
#import "ResetPswViewController.h"


typedef NS_ENUM(NSUInteger, MNAccountType) {
    MNAccountTypeUIN,
    MNAccountTypeQuestionAndAnswer,
    MNAccountTypeAccount,
};
@interface MNLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;

@property (nonatomic, assign) MNAccountType accountType;

@end

@implementation MNLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)resetPassword:(id)sender {
    [self.navigationController pushViewController:[ResetPswViewController new] animated:YES];
}
- (IBAction)quickLogin:(id)sender {
    MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeQuickRegAccount];
    [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
    } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
        if (token) {
            [self loginsuccessWithToken:token account:self.accountTextField.text];
        }
    }];
    //[self resetQuickRegpwd];
}
//重置快速注册密码
- (void)resetQuickRegpwd {
    [MNWSDK setPasswordForQuickRegisterWithAccount:@"FC330752107217633280" password:@"892400yy" onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
    }];
}

- (IBAction)changeNormalLogin:(id)sender {
    self.accountType = MNAccountTypeUIN;
    self.answerTextField.hidden = YES;
    self.accountTextField.text = nil;
    self.pwdTextField.text = nil;
    self.answerTextField.text = nil;
    self.accountTextField.placeholder = @"请输入迷你号";
    self.pwdTextField.placeholder = @"请输入密码";
}

- (IBAction)communicationCardRegOrLogin:(id)sender {
    self.accountType = MNAccountTypeAccount;
    self.answerTextField.hidden = YES;
    self.accountTextField.text = nil;
    self.pwdTextField.text = nil;
    self.answerTextField.text = nil;
    self.accountTextField.placeholder = @"请输入通行证";
    self.pwdTextField.placeholder = @"请输入密码";
}
- (IBAction)questionAndAnswerLogin:(id)sender {
    self.accountType = MNAccountTypeQuestionAndAnswer;
    self.answerTextField.hidden = NO;
    self.accountTextField.text = nil;
    self.pwdTextField.text = nil;
    self.answerTextField.text = nil;
    self.accountTextField.placeholder = @"请输入账号";
    self.pwdTextField.placeholder = @"请输入问题";
}

- (IBAction)login:(id)sender {
    switch (self.accountType) {
        case MNAccountTypeUIN:
        {
            MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeOldAccount accountNum:self.accountTextField.text passWord:self.pwdTextField.text];
            [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
                [self showToast:msg];
            } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
                if (token) {
                    [self loginsuccessWithToken:token account:self.accountTextField.text];
                }
            }];
        }
            
            break;
        case MNAccountTypeAccount:
        {
//            [MNWSDK registerAccountWithAccount:self.accountTextField.text password:self.pwdTextField.text onResult:^(MNWCode code, NSString * _Nullable msg) {
//                [self showToast:msg];
//            } onAuthResult:^(MNWToken * _Nullable token) {
//                if (token) {
//                    [self loginsuccessWithToken:token account:self.accountTextField.text];
//                }
//               
//            }];
            MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeNewAccount accountNum:self.accountTextField.text passWord:self.pwdTextField.text];
            [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
                [self showToast:msg];
            } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
                if (token) {
                    [self loginsuccessWithToken:token account:self.accountTextField.text];
                }
            }];
        }
            
            break;
        case MNAccountTypeQuestionAndAnswer:
        {
            MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeOldAccountQuestion accountNum:self.accountTextField.text securityQuestion:self.pwdTextField.text answer:self.answerTextField.text];
            [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
                [self showToast:msg];
            } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
                if (token) {
                    [self loginsuccessWithToken:token account:self.accountTextField.text];
                }
            }];
        }
            
            break;
            
        default:
            break;
    }
}

- (IBAction)facebookLogin:(id)sender {
    MNWLoginParam *loginParam = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeFaceBook];
    [MNWSDK loginWithMNWLoginParam:loginParam onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
    } onLoginResult:^(MNWUser * _Nullable user) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@,%@",user.nickname,user.icon ]);
    } onAuthResult:^(MNWToken * _Nullable token) {
        if (token) {
            [self loginsuccessWithToken:token account:nil];
        }
    }];
}
- (IBAction)googleLogin:(id)sender {
    MNWLoginParam *loginParam = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeGoogle];
    [MNWSDK loginWithMNWLoginParam:loginParam onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
    } onLoginResult:^(MNWUser * _Nullable user) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@,%@",user.nickname,user.icon ]);
    } onAuthResult:^(MNWToken * _Nullable token) {
        if (token) {
            [self loginsuccessWithToken:token account:nil];
        }
    }];
}
- (IBAction)appleLogin:(id)sender {
    MNWLoginParam *loginParam = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeApple];
    [MNWSDK loginWithMNWLoginParam:loginParam onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
        //处理msg的示例：
        if ([msg containsString:@"errorCode"]) {
            NSArray *strArray = [msg componentsSeparatedByString:@":"];
            NSString *resultCode = [strArray[1] componentsSeparatedByString:@","].firstObject;
            NSString *resultMsg = strArray.lastObject;
            NSDictionary *dict = @{@"resultCode":resultCode, @"resultMsg": resultMsg};
            NSString *jsonString = dict.toJSONString;
        } else {
            NSDictionary *dict = @{@"resultCode":@(code), @"resultMsg": msg};
            NSString *jsonString = dict.toJSONString;
        }
    } onLoginResult:^(MNWUser * _Nullable user) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@,%@",user.nickname,user.icon ]);
    } onAuthResult:^(MNWToken * _Nullable token) {
        if (token) {
            [self loginsuccessWithToken:token account:nil];
        }
    }];
}


- (IBAction)smsLogin:(id)sender {
    MNSMSLoginViewController *smsVC = [MNSMSLoginViewController new];
    smsVC.type = 1;
    [self.navigationController pushViewController:smsVC animated:YES];
}
- (IBAction)emailLogin:(id)sender {
    MNSMSLoginViewController *emailVC = [MNSMSLoginViewController new];
    emailVC.type = 2;
    [self.navigationController pushViewController:emailVC animated:YES];
}

- (void)loginsuccessWithToken:(MNWToken *)token account:(NSString *)account {
    [[NSUserDefaults standardUserDefaults] setObject:token.userId forKey:kLoginUserID];
    [[NSUserDefaults standardUserDefaults] setObject:token.unifiedToken forKey:kLoginToken];
    [[NSUserDefaults standardUserDefaults] setObject:account ?:@"" forKey:kLoginAccount];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSucceedNotification object:nil];
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
