#import <Foundation/Foundation.h>

@protocol MNViewModelProtocol <NSObject>

@required
- (void)initModel;

- (void)updateModel;

@end
