#import <UIKit/UIKit.h>

@interface MNCustomNavigationBar : UIView

@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UIButton *leftButton;
@property (nonatomic, readonly) UIButton *rightButton;

- (void)setTitle:(NSString *)title;

@end
