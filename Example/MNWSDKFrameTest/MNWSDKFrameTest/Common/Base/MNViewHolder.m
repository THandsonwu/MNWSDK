#import "MNViewHolder.h"
#import "MNController.h"

@interface MNViewHolder ()

@property (nonatomic, strong) MNCustomNavigationBar *customNavigationBar;

@end

@implementation MNViewHolder

- (instancetype)initWithController:(UIViewController<MNController> *)controller {
    if (self = [super init]) {
        self.controller = controller;
        self.rootView = controller.rootView;
    }
    return self;
}

- (void)dealloc {
    [self onDestroy];
}

- (void)onCreate {
    self.rootView.backgroundColor = [UIColor whiteColor];
}

- (void)onDestroy {
    
}

- (void)onLayout {
   
}

- (void)setController:(UIViewController<MNController> *)controller {
    _controller = controller;
    self.rootView = controller.rootView;
}

- (void)createCustomNavigationBar {
    if (!self.customNavigationBar) {
        self.customNavigationBar = [[MNCustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUSBAR_NAVBAR_HEIGHT)];
        [self.rootView addSubview:self.customNavigationBar];
    }
}

@end
