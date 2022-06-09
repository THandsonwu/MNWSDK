#import <UIKit/UIKit.h>
#import "MNViewOperation.h"
//protocol
#import "MNController.h"

@interface MNViewController<ViewModelType, ViewHolderType> : UIViewController <MNController, MNViewOperationProtocal>

@property (nonatomic, strong) ViewModelType viewModel;
@property (nonatomic, strong) ViewHolderType viewHolder;
@property (nonatomic, strong) MNViewOperation* viewOperation;
@property (nonatomic, assign) BOOL isCustomNavigationBar;

/// 创建系统导航栏
- (void)setupNavigationBar;

/// 创建自定义导航栏
- (void)setupCustomNavigationBar;

/// 创建系统导航栏（带标题）
/// @param title 导航栏标题
- (void)setupNavigationBarWithTitle:(NSString *)title;

/// 创建自定义导航栏（带标题）
/// @param title 导航栏标题
- (void)setupCustomNavigationBarWithTitle:(NSString *)title;


@end
