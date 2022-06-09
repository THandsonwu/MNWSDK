#import "MNViewModel.h"

@interface MNViewModel ()

@end

@implementation MNViewModel

- (void)dealloc {
    [self onDestroy];
}

- (void)onCreate {
    [self initModel];
    [self updateModel];
}

- (void)onDestroy {
    
}

#pragma mark - public methods

#pragma mark - private methods

- (void)initModel {
    
}

- (void)updateModel {
    
}

@end
