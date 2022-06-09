#import <Foundation/Foundation.h>
//protocol
#import "MNLifeCycle.h"
#import "MNViewHolderProtocol.h"
//view
#import "MNCustomNavigationBar.h"

@protocol MNController;

@interface MNViewHolder : NSObject <MNLifeCycle, MNViewHolderProtocol>

- (instancetype)initWithController:(UIViewController<MNController> *)controller;

@property (nonatomic, weak) UIViewController<MNController> *controller;
@property (nonatomic, weak) UIView *rootView;

@property (nonatomic, strong, readonly) MNCustomNavigationBar *customNavigationBar;

- (void)createCustomNavigationBar;

@end
