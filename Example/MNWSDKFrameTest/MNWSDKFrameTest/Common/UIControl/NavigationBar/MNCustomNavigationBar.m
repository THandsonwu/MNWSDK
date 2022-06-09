#import "MNCustomNavigationBar.h"

@interface MNCustomNavigationBar()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation MNCustomNavigationBar

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat y = (NAVBAR_HEIGHT - 24) * 0.5 + STATUSBAR_HEIGHT;
        self.leftButton.frame = CGRectMake(15, y, 50, 24);
        [self addSubview:self.leftButton];
        
        CGFloat x = SCREEN_WIDTH - 50 - 15;
        y = (NAVBAR_HEIGHT - 24) * 0.5 + STATUSBAR_HEIGHT;
        self.rightButton.frame = CGRectMake(x, y, 50, 24);
        [self addSubview:self.rightButton];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(self.leftButton);
        }];
    }
    return self;
}

#pragma mark - Public

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _rightButton;
}

@end
