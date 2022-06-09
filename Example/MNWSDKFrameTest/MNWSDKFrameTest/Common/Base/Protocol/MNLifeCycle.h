#import <Foundation/Foundation.h>

@protocol MNLifeCycle

@required
- (void)onCreate;
- (void)onDestroy;

@end
