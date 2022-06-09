//
//  UIViewController+Extends.h
//  sdksample
//
//  Created by mini1 on 2021/3/1.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^AlertViewDidClickAction)(NSInteger buttonIndex);

@interface UIViewController (AlertView)

- (void)showSimpleAlertWithMessage:(NSString *)message;

- (void)showSimpleAlertViewWithTitle:(NSString *)title message:(NSString *)message;

- (void)showSimpleAlertViewWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString*)buttonTitle;

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction buttonTitle:(NSString *)buttonTitle;

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction buttonTitle:(NSString *)buttonTitle;

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)showAlertSheetWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)showAlertSheetWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonIndex:(NSInteger)destructiveButtonIndex otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (void)showAlertControllerWithStyle:(UIAlertControllerStyle)preferredStyle title:(nullable NSString *)title message:(nullable NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonIndex:(NSInteger)destructiveButtonIndex otherButtonTitles:(NSMutableArray *)otherButtonTitles;


@end

NS_ASSUME_NONNULL_END
