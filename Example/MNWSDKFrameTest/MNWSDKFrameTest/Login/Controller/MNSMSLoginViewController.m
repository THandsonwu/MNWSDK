//
//  MNSMSLoginViewController.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/18.
//

#import "MNSMSLoginViewController.h"

@interface MNSMSLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneAreaTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTF;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIButton *vcodeBtn;

@end

@implementation MNSMSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.type == 1) {
        self.phoneTF.placeholder = @"请输入手机号";
        self.phoneAreaTF.hidden = NO;
        self.titleLB.text = @"手机号登录";
        [self.vcodeBtn setTitle:@"获取手机验证码" forState: UIControlStateNormal];
    }else {
        self.phoneTF.placeholder = @"请输入邮箱";
        self.phoneAreaTF.hidden = YES;
        self.titleLB.text = @"邮箱号登录";
        [self.vcodeBtn setTitle:@"获取邮箱验证码" forState: UIControlStateNormal];
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getVerifyCode:(UIButton *)sender {
    if (self.type == 1) {
        MNWVerCodeParam *param = [[MNWVerCodeParam alloc] initWithCodeType:MNWVerCodeTypePhoneVerCode phone:self.phoneTF.text phoneAreaCode:self.phoneAreaTF.text];
        [MNWSDK getVerifyCode:param onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];
    }else {
        MNWVerCodeParam *param = [[MNWVerCodeParam alloc] initWithCodeType:MNWVerCodeTypeEmailVerCode email:self.phoneTF.text];
        [MNWSDK getVerifyCode:param onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];
    }
   
}
- (IBAction)loginSms:(UIButton *)sender {
    if (self.type == 1) {
        MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypePhone phone:self.phoneTF.text phoneAreaCode:self.phoneAreaTF.text verifyCode:self.verifyCodeTF.text];
        [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
            if (token) {
                [self loginsuccessWithToken:token account:self.phoneTF.text];
            }
        }];
    }else {
        MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypeEmail email:self.phoneTF.text verifyCode:self.verifyCodeTF.text];
        [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
            if (token) {
                [self loginsuccessWithToken:token account:self.phoneTF.text];
            }
        }];
    }
   
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
