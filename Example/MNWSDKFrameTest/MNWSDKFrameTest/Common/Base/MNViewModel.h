#import <Foundation/Foundation.h>
#import "MNLifeCycle.h"
#import "MNViewModelProtocol.h"

@protocol MNSharedModel;

@interface MNViewModel : NSObject <MNLifeCycle, MNViewModelProtocol>

@end
