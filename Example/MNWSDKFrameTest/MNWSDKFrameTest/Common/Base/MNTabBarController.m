#import "MNTabBarController.h"

@interface MNTabBarController ()

@end

@implementation MNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onCreate];
}

- (void)dealloc {
    [self onDestroy];
}

- (NSString *)customViewModelClassName {
    return nil;
}

- (NSString *)customViewHolderClassName {
    return nil;
}

- (UIView *)rootView {
    return self.view;
}

- (void)onCreate {
    NSString *controllerClassName = NSStringFromClass([self class]);
    NSString *viewModelClassName = self.customViewModelClassName ? self.customViewModelClassName :
    [controllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewModel"];
    NSString *viewHolderClassName = self.customViewHolderClassName ? self.customViewHolderClassName :
    [controllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewHolder"];
    Class viewModelClass = NSClassFromString(viewModelClassName);
    Class viewHolderClass = NSClassFromString(viewHolderClassName);
    
    self.viewModel = [[viewModelClass alloc] init];
    self.viewHolder = [[viewHolderClass alloc] initWithController:self];
    self.viewOperation = [[MNViewOperation alloc] initWithController:self];
    
    [self.viewModel onCreate];
    [self.viewHolder onCreate];
}

- (UIViewController *)asViewController {
    return self;
}

- (void)onDestroy {
    
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

#pragma mark - MNViewOperationProtocal

- (void)showActionSheetWithViewController:(UIViewController *)viewController
                                    title:(NSString *)title
                                  message:(NSString *)message
                                  actions:(NSArray *)actions {
    [self.viewOperation showActionSheetWithViewController:viewController
                                                    title:title
                                                  message:message
                                                  actions:actions];
}

- (void)showAlertViewWithViewController:(UIViewController *)viewController
                                  title:(NSString *)title
                                message:(NSString *)message
                                actions:(NSArray *)actions {
    [self.viewOperation showAlertViewWithViewController:viewController
                                                  title:title
                                                message:message
                                                actions:actions];
}

@end
