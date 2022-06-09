//
//  UIViewController+Extends.h
//  sdksample
//
//  Created by mini1 on 2021/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extends)
- (void)showLoading;

- (void)showLoading:(NSString *)content;

- (void)stopLoading;

- (void)showToast:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
