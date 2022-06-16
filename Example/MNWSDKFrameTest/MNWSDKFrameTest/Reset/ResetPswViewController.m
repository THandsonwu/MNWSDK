//
//  ResetPswViewController.m
//  MNWSDKFrameTest
//
//  Created by 谭志武 on 2022/5/31.
//

#import "ResetPswViewController.h"

typedef NS_ENUM(NSUInteger, ResetType) {
    ResetTypeAccount,
    ResetTypeUinOrEmail,
};

@interface ResetPswViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *pswTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *resetTypeSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *verifyCodeTypeSeg;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailHeight;
@property (nonatomic, assign) ResetType resetType;
@property (nonatomic, assign) MNWResetWay resetWay;
@property (weak, nonatomic) IBOutlet UILabel *bindInfoLB;

@end

//1234567890B
@implementation ResetPswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.resetType = ResetTypeAccount;
    self.resetWay = MNWResetWayPhone;
    

}
- (IBAction)changeResetType:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.accountTF.placeholder = @"通信证";
        self.resetType = ResetTypeAccount;
        self.emailTF.hidden = YES;
        self.emailHeight.constant = 0;
        self.verifyCodeTypeSeg.enabled = YES;
    } else {
        self.accountTF.placeholder = @"迷你号";
        self.resetType = ResetTypeUinOrEmail;
        self.emailTF.hidden = NO;
        self.emailHeight.constant = 34;
        self.verifyCodeTypeSeg.selectedSegmentIndex = 1;
        self.verifyCodeTypeSeg.enabled = NO;
    }
}
- (IBAction)changeVerifyCodeType:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.resetWay = MNWResetWayPhone;
    } else {
        self.resetWay = MNWResetWayEmail;
    }
}
- (IBAction)sendVerifyCode:(UIButton *)sender {
    if (self.resetType == ResetTypeAccount) {
        [MNWSDK sendResetVerifyCodeWithAccount:self.accountTF.text resetWay:self.resetWay onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];

    } else {
        [MNWSDK sendResetVerifyCodeWithUin:self.accountTF.text email:self.emailTF.text onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];
    }
}

- (IBAction)resetPswAction:(UIButton *)sender {
    if (self.resetType == ResetTypeAccount) {
        [MNWSDK resetAccountWithAccount:self.accountTF.text newPassword:self.pswTF.text verifyCode:self.verifyCodeTF.text onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];
    } else {
        [MNWSDK resetAccountWithUin:self.accountTF.text email:self.emailTF.text newPassword:self.pswTF.text onResult:^(MNWCode code, NSString * _Nullable msg) {
            [self showToast:msg];
        }];
    }
}
- (IBAction)getBindInfo:(UIButton *)sender {
    if (self.accountTF.text.length == 0) {
        [self showToast:@"请输入通行证账号"];
        return;
    }
    [MNWSDK queryBindAccountInfoWithAccount:self.accountTF.text onResult:^(MNWCode code, NSString * _Nullable msg) {
        
    } completionHandler:^(id  _Nullable responseObject) {
        NSString *str = [self dictionaryToJson:responseObject];
        self.bindInfoLB.text = str;
    }];
}

- (NSString *)dictionaryToJson:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
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
