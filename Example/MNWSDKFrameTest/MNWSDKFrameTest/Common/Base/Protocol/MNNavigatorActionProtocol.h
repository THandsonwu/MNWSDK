#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MNNavigatorActionProtocol <NSObject>

@optional

- (void)popViewControllerAnimated:(nullable UIViewController *)from;

@end

NS_ASSUME_NONNULL_END
