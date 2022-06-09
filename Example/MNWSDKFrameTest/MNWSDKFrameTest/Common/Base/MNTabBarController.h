#import <UIKit/UIKit.h>
#import "MNController.h"
#import "MNViewOperation.h"

@interface MNTabBarController<ViewModelType, ViewHolderType> : UITabBarController <MNController,MNViewOperationProtocal>

@property (nonatomic, strong) ViewModelType viewModel;
@property (nonatomic, strong) ViewHolderType viewHolder;
@property (nonatomic, strong) MNViewOperation* viewOperation;

@end

