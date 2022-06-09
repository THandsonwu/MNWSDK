#import "MNViewOperationProtocal.h"
#import "MNController.h"

@interface MNViewOperation : NSObject<MNViewOperationProtocal>

@property(nonatomic, weak) id<MNController> hostController;

- (instancetype)initWithController:(id<MNController>)controller;

@end

