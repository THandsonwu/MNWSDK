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

@end

@implementation MNSMSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getVerifyCode:(UIButton *)sender {
    MNWVerCodeParam *param = [[MNWVerCodeParam alloc] initWithCodeType:MNWVerCodeTypePhoneVerCode phone:self.phoneTF.text phoneAreaCode:self.phoneAreaTF.text];
    [MNWSDK getVerifyCode:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        [self showToast:msg];
    }];
}
- (IBAction)loginSms:(UIButton *)sender {
    MNWLoginParam *param = [[MNWLoginParam alloc] initWithLoginType:MNWLoginTypePhone phone:self.phoneTF.text phoneAreaCode:self.phoneAreaTF.text verifyCode:self.verifyCodeTF.text];
    [MNWSDK loginWithMNWLoginParam:param onResult:^(MNWCode code, NSString * _Nullable msg) {
        
    } onLoginResult:nil onAuthResult:^(MNWToken * _Nullable token) {
        if (token) {
            [self loginsuccessWithToken:token account:self.phoneTF.text];
        }
    }];
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
