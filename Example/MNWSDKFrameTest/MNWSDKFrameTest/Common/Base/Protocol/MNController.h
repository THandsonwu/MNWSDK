#import <Foundation/Foundation.h>
#import "MNViewHolder.h"
#import "MNViewModel.h"

@protocol MNController <NSObject, MNLifeCycle>

@required
- (NSString *)customViewModelClassName;
- (NSString *)customViewHolderClassName;

@optional
- (void)bindViewToModel;
- (void)bindModelToView;
- (void)bindViewAndModel;
- (void)bindEvent;

@property (nonatomic, readonly) UIView *rootView;

@end
