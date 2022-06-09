#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MNViewOperationProtocal <NSObject>

@required
- (void)showAlertViewWithViewController:(UIViewController *)viewController
                                  title:(NSString *)title
                                message:(NSString *)message
                                actions:(NSArray *)actions;

- (void)showActionSheetWithViewController:(UIViewController *)viewController
                                    title:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions;

@end

