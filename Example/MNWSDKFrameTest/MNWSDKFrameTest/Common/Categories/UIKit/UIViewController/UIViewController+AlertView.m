//
//  UIViewController+Extends.h
//  sdksample
//
//  Created by mini1 on 2021/3/1.
//

#import "UIViewController+AlertView.h"

#define buttonTitlesArrayFromOtherButtonTitles \
NSMutableArray* buttonTitlesArray = [NSMutableArray array];\
if(otherButtonTitles)\
{\
    if([otherButtonTitles isKindOfClass:[NSArray class]]) {\
        [buttonTitlesArray addObjectsFromArray:(NSArray*)otherButtonTitles];\
    } else {\
        [buttonTitlesArray addObject:otherButtonTitles];\
    }\
    va_list args;\
    va_start(args, otherButtonTitles);\
    NSString *theTitle;\
    while ((theTitle = va_arg(args, NSString *))) {\
        [buttonTitlesArray addObject:theTitle];\
    }\
    va_end(args);\
}\

@implementation UIViewController (AlertView)

- (void)showSimpleAlertWithMessage:(NSString *)message;
{
    [self showSimpleAlertViewWithTitle:@"温馨提示" message:message];
}


- (void)showSimpleAlertViewWithTitle:(NSString *)title message:(NSString *)message;
{
    [self showSimpleAlertViewWithTitle:title message:message buttonTitle:@"确认"];
}

- (void)showSimpleAlertViewWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString*)buttonTitle
{
    [self showAlertViewWithTitle:title message:message clickedBlock:^(NSInteger buttonIndex) {
        //NSLog(@"showAlertView complection.");
    } cancelButtonTitle:buttonTitle otherButtonTitles:nil];
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction buttonTitle:(NSString *)buttonTitle
{
    NSMutableArray* buttonTitlesArray = [NSMutableArray array];
    [self showAlertControllerWithStyle:UIAlertControllerStyleAlert title:title message:message clickedBlock:clickedAction cancelButtonTitle:buttonTitle destructiveButtonIndex:-1 otherButtonTitles:buttonTitlesArray];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction buttonTitle:(NSString *)buttonTitle
{
    NSMutableArray *buttonTitlesArray = [NSMutableArray array];
    
    UIViewController *vc = [[UIViewController alloc] init];
    [vc showAlertControllerWithStyle:UIAlertControllerStyleAlert title:title message:message clickedBlock:clickedAction cancelButtonTitle:buttonTitle destructiveButtonIndex:-1 otherButtonTitles:buttonTitlesArray];
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    buttonTitlesArrayFromOtherButtonTitles
    
    [self showAlertControllerWithStyle:UIAlertControllerStyleAlert title:title message:message clickedBlock:clickedAction cancelButtonTitle:cancelButtonTitle destructiveButtonIndex:-1 otherButtonTitles:buttonTitlesArray];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    buttonTitlesArrayFromOtherButtonTitles
    
    UIViewController *vc = [[UIViewController alloc] init];
    [vc showAlertControllerWithStyle:UIAlertControllerStyleAlert title:title message:message clickedBlock:clickedAction cancelButtonTitle:cancelButtonTitle destructiveButtonIndex:1 otherButtonTitles:buttonTitlesArray];
}

- (void)showAlertSheetWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    buttonTitlesArrayFromOtherButtonTitles
    
    [self showAlertControllerWithStyle:UIAlertControllerStyleActionSheet title:title message:message clickedBlock:clickedAction cancelButtonTitle:cancelButtonTitle destructiveButtonIndex:-1 otherButtonTitles:buttonTitlesArray];
}

- (void)showAlertSheetWithTitle:(NSString *)title message:(NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonIndex:(NSInteger)destructiveButtonIndex otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    buttonTitlesArrayFromOtherButtonTitles
    
    [self showAlertControllerWithStyle:UIAlertControllerStyleActionSheet title:title message:message clickedBlock:clickedAction cancelButtonTitle:cancelButtonTitle destructiveButtonIndex:destructiveButtonIndex otherButtonTitles:buttonTitlesArray];
}

//(nullable NSString *)title message:(nullable NSString *)message
- (void)showAlertControllerWithStyle:(UIAlertControllerStyle)preferredStyle title:(nullable NSString *)title message:(nullable NSString *)message clickedBlock:(AlertViewDidClickAction)clickedAction cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonIndex:(NSInteger)destructiveButtonIndex otherButtonTitles:(NSMutableArray *)otherButtonTitles
{
    NSMutableArray* allButtonTitles = [NSMutableArray arrayWithArray:otherButtonTitles];
    if(cancelButtonTitle) {
        [allButtonTitles insertObject:cancelButtonTitle atIndex:0];
    }
    UIAlertController* alterController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    NSInteger buttonIndex = 0;
    for(NSString* actionTitle in allButtonTitles)
    {
        UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
        if([cancelButtonTitle isEqualToString:actionTitle]) {
            actionStyle = UIAlertActionStyleCancel;
        } else if(buttonIndex == destructiveButtonIndex) {
            actionStyle = UIAlertActionStyleDestructive;
        }
        //@weakify(self)
        UIAlertAction* specAction = [UIAlertAction actionWithTitle:actionTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
            //@strongify(self)
            if(clickedAction) clickedAction(buttonIndex);
        }];
        [alterController addAction:specAction];
        buttonIndex++;
    }
    
    //查找当前显示VC
    UIViewController *mostFrontViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (mostFrontViewController.presentedViewController) {
        mostFrontViewController = mostFrontViewController.presentedViewController;
    }
    [mostFrontViewController presentViewController:alterController animated:YES completion:nil];
}

@end
