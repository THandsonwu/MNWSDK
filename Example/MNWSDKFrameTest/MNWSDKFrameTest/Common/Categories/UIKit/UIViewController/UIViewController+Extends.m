//
//  UIViewController+Extends.m
//  sdksample
//
//  Created by mini1 on 2021/3/1.
//

#import "UIViewController+Extends.h"

@implementation UIViewController (Extends)

- (void)showLoading {
    [SVProgressHUD show];
}

- (void)showLoading:(NSString *)content {
    if ([content isNotEmpty]) {
        [SVProgressHUD showWithStatus:content];
    }
}

- (void)stopLoading {
    [SVProgressHUD dismiss];
}

- (void)showToast:(NSString *)content {
    if ([content isNotEmpty]) {
        [Toast makeToast:content];
    }
}
@end
