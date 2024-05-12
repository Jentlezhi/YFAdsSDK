//
//  YFViewController.m
//  YFAdsSDK
//
//  Created by Jentle on 03/12/2024.
//  Copyright (c) 2024 Jentle. All rights reserved.
//

#import "YFViewController.h"
#import "Masonry.h"
#import <YFAdsSDK/YFAdsSDK.h>
#import "YYFNativeRenderVideoDemoView.h"
#import "YYFNativeRenderNormalDemoView.h"
#import "YFMulNativeExpressConentViewController.h"

@interface YFViewController ()<YFSplashDelegate>


@property(nonatomic, strong) UITextField *splashTextField;

@property(nonatomic, strong) UIButton *splashBtn;

@property(nonatomic, strong) UITextField *nativeRenderTextField;

@property(nonatomic, strong) UIButton *nativeRenderBtn;

///强引用广告对象，否则会被释放无法正常显示
@property(nonatomic, strong) YFSplashManager *splashManager;

@end

@implementation YFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configs];
    [self setupTable];
}

- (void)configs {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"元坊SDK Demo";
}
- (void)setupTable {
    [self.view addSubview:self.splashTextField];
    [self.view addSubview:self.splashBtn];
    [self.view addSubview:self.nativeRenderTextField];
    [self.view addSubview:self.nativeRenderBtn];
    
    [self.splashTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.inset(15.f);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20.f);
    }];
    [self.splashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.splashTextField);
        make.top.equalTo(self.splashTextField.mas_bottom).offset(10.f);
    }];
    
    [self.nativeRenderTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.splashBtn.mas_bottom).offset(20.f);
        make.left.right.height.equalTo(self.splashTextField);
    }];
    [self.nativeRenderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.nativeRenderTextField);
        make.top.equalTo(self.nativeRenderTextField.mas_bottom).offset(10.f);
    }];
}

#pragma mark - Lazyload
- (UITextField *)splashTextField {
    if (!_splashTextField) {
        _splashTextField = [UITextField new];
        _splashTextField.text = @"14323547";
        _splashTextField.placeholder = @"请输入开屏广告的posId";
        _splashTextField.textColor = [UIColor.blackColor colorWithAlphaComponent:0.7f];
//        [self setBorderWithView:_splashTextField color:UIColor.purpleColor];
    }
    return _splashTextField;
}
- (UIButton *)splashBtn {
    if (!_splashBtn) {
        _splashBtn = [UIButton new];
        [_splashBtn setTitle:@"开屏广告" forState:UIControlStateNormal];
        _splashBtn.backgroundColor = UIColor.purpleColor;
        _splashBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
        [_splashBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_splashBtn addTarget:self action:@selector(splashAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _splashBtn;
}
- (UITextField *)nativeRenderTextField {
    if (!_nativeRenderTextField) {
        _nativeRenderTextField = [UITextField new];
        _nativeRenderTextField.text = @"52843544";
        _nativeRenderTextField.placeholder = @"请输入原生渲染的posId";
        _nativeRenderTextField.textColor = [UIColor.blackColor colorWithAlphaComponent:0.7f];
    }
    return _nativeRenderTextField;
}
- (UIButton *)nativeRenderBtn {
    if (!_nativeRenderBtn) {
        _nativeRenderBtn = [UIButton new];
        [_nativeRenderBtn setTitle:@"原生渲染" forState:UIControlStateNormal];
        _nativeRenderBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
        _nativeRenderBtn.backgroundColor = UIColor.purpleColor;
        [_nativeRenderBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_nativeRenderBtn addTarget:self action:@selector(nativeRenderAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nativeRenderBtn;
}

- (void)splashAction {
    if (self.splashTextField.text.length == 0) {
        NSAssert(NO, @"请输入podId");
    }
    ///每次都要重新生成，不能用懒加载
    _splashManager = [[YFSplashManager alloc] initWithConfig:^(YFSplashConfig * _Nonnull config) {
        config.posId = self.splashTextField.text;
        config.shouldShowLogo = YES;
        config.logoSize = CGSizeMake(self.view.bounds.size.width, 70.f);
        config.logoImage = [UIImage imageNamed:@"app_logo"];
        config.adSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 70);
        config.backgroundImage = [UIImage imageNamed:@"launch_image"];
    }];
    _splashManager.delegate = self;
    [_splashManager loadData];
}

- (void)nativeRenderAction {
    if (self.nativeRenderTextField.text.length == 0) {
        NSAssert(NO, @"请输入podId");
    }
    YFMulNativeExpressConentViewController *nativeVC = [YFMulNativeExpressConentViewController new];
    nativeVC.posId = self.nativeRenderTextField.text;
    [self.navigationController pushViewController:nativeVC animated:YES];
}
#pragma mark - YFSplashDelegate
- (void)adsBeginLoad:(YFSplashManager *)manager {
    NSLog(@"adsBeginLoad");
}
/**
 广告数据加载成功
 */
- (void)adsDidLoadSuccess:(YFSplashManager *)manger {
    ///显示广告
    [self.splashManager showSplash];
}
- (void)adsDidLoadFail:(YFSplashManager *)manger {
    NSLog(@"adsDidLoadFail");
}

@end

