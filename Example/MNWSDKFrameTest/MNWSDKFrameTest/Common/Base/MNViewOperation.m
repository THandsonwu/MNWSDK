#import "MNViewOperation.h"
#import "MNController.h"

@interface MNViewOperation ()

@end

@implementation MNViewOperation

- (instancetype)initWithController:(id<MNController>)controller {
    self = [super init];
    if (self) {
        self.hostController = controller;
    }
    return self;
}

- (void)showActionSheetWithViewController:(UIViewController * _Nonnull)viewController
                                    title:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    if(actions != nil && actions.count >0) {
        [actions enumerateObjectsUsingBlock:^(id  _Nonnull action, NSUInteger idx, BOOL * _Nonnull stop) {
            if (action != nil) {
                [alertView addAction: (UIAlertAction *)action];
            }
        }];
    }
    [viewController presentViewController:alertView animated:YES completion:nil];
}

- (void)showAlertViewWithViewController:(UIViewController * _Nonnull)viewController
                                  title:(NSString *)title
                                message:(NSString *)message
                                actions:(NSArray *)actions {
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
    if(actions != nil && actions.count >0) {
        [actions enumerateObjectsUsingBlock:^(id  _Nonnull action, NSUInteger idx, BOOL * _Nonnull stop) {
            if (action != nil) {
                [alertView addAction: (UIAlertAction *)action];
            }
        }];
    }
    [viewController presentViewController:alertView animated:YES completion:nil];
}

@end
