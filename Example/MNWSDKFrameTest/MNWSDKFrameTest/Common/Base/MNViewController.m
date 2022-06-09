#import "MNViewController.h"
#import "MNViewOperation.h"

//runtime
#import <objc/runtime.h>

//view
#import "MNCustomNavigationBar.h"
#import "MNNavigationController.h"

@interface MNViewController ()

@end

@implementation MNViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initViewAndModel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initViewAndModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onCreate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.isCustomNavigationBar) {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    } else {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.viewHolder onLayout];
}

- (void)dealloc {
    [self onDestroy];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - NMController

- (UIView *)rootView {
    return self.view;
}

- (void)onCreate {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    ((MNViewHolder *)self.viewHolder).controller = self;
    
    [self.viewModel onCreate];
    [self.viewHolder onCreate];
    
    [self bindViewToModel];
    [self bindModelToView];
    [self bindViewAndModel];
    [self bindEvent];
}

- (void)onDestroy {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)bindViewToModel {
    
}

- (void)bindModelToView {
    
}

- (void)bindViewAndModel {
    
}

- (void)bindEvent {
    
}

- (NSString *)customViewHolderClassName {
    return nil;
}

- (NSString *)customViewModelClassName {
    return nil;
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

- (MNViewController *)ancestorViewController {
    MNViewController *viewController = self;
    while ((viewController.parentViewController != nil) &&
           ([viewController.parentViewController isKindOfClass:[MNViewController class]])) {
        viewController = (MNViewController *)viewController.parentViewController;
    }
    return viewController;
}


#pragma mark - private methods

- (void)initViewAndModel {
    NSString *controllerClassName = NSStringFromClass([self class]);
    NSString *viewModelClassName = [self customViewModelClassName] ? [self customViewModelClassName] :
    [controllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewModel"];
    NSString *viewHolderClassName = [self customViewHolderClassName] ? [self customViewHolderClassName] :
    [controllerClassName stringByReplacingOccurrencesOfString:@"ViewController" withString:@"ViewHolder"];
    Class viewModelClass = NSClassFromString(viewModelClassName);
    Class viewHolderClass = NSClassFromString(viewHolderClassName);
    
    _viewModel = [[viewModelClass alloc] init];
    _viewHolder = [[viewHolderClass alloc] init];
    _viewOperation = [[MNViewOperation alloc] initWithController:self];
}

- (void)setupNavigationBar {
    
    self.navigationItem.backBarButtonItem = nil;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backBtn setImage:[UIImage imageNamed:@"ico_back_dark"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 24);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)setupCustomNavigationBar {
    if (!self.isCustomNavigationBar) {
        NSAssert(NO, @"self.isCustomNavigationBar needs to be set to YES");
    }
    [self.viewHolder createCustomNavigationBar];
}

- (void)setupNavigationBarWithTitle:(NSString *)title {
    self.navigationItem.title = title;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backBtn setImage:[UIImage imageNamed:@"ico_back_dark"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 24);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)setupCustomNavigationBarWithTitle:(NSString *)title {
    if (!self.isCustomNavigationBar) {
        NSAssert(NO, @"isCustomNavigationBar needs to be set to YES");
    }
    [self.viewHolder createCustomNavigationBar];
    
    [((MNViewHolder *)self.viewHolder).customNavigationBar setTitle:title];
    
    UIButton *leftButton = ((MNViewHolder *)self.viewHolder).customNavigationBar.leftButton;
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backAction {
    if (self.navigationController.viewControllers.count > 0) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
