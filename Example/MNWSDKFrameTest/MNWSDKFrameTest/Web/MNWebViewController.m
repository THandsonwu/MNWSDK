//
//  MNWebViewController.m
//  sdksample
//
//  Created by youhui on 2021/3/13.
//

#import "MNWebViewController.h"
#import <WebKit/WebKit.h>

@interface MNWebViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation MNWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupNavbar {
    UIButton *navLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    navLeftButton.frame = CGRectMake(0, 0, 44, 44);
    [navLeftButton addTarget:self action:@selector(navLeftAction) forControlEvents:UIControlEventTouchUpInside];
    [navLeftButton setImage:[UIImage imageNamed:@"ico_back_dark"] forState:UIControlStateNormal];
    navLeftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 44 - 20);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:navLeftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setupUI {
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    [self.webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:NSKeyValueObservingOptionNew context:nil];
    
    self.progressView = [[UIProgressView alloc] init];
    self.progressView.trackTintColor = [UIColor clearColor];
    self.progressView.progressTintColor = RGBHex(0xFBD027);
    self.progressView.alpha = 0;
    [self.view addSubview:self.progressView];
    [self.progressView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(3);
    }];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrlString]];
    [self.webView loadRequest:request];
}

- (void)navLeftAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    if (self.isViewLoaded) {
        [self.webView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) context:nil];
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]) {
        self.progressView.alpha = 1;
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        
        if (self.webView.estimatedProgress >= 1) {
            [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.progressView.alpha = 0;
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0 animated:NO];
            }];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
}

@end
