//
//  YFSplashViewController.m
//  YFAdsSDK_Example
//
//  Created by Jentle-Zhi on 2024/3/13.
//  Copyright © 2024 Jentle. All rights reserved.
//

#import "YFSplashViewController.h"
#import <YFAdsSDK/YFAdsSDK.h>
#import "Masonry.h"

@interface YFSplashViewController ()<YFSplashDelegate, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *dataArr;
///强引用广告对象，否则会被释放无法正常显示
@property(nonatomic, strong) YFSplashManager *splashManager;
@end

@implementation YFSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTable];
}

- (void)setupTable {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row][@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self yf];
    }
    [self.splashManager loadData];
}
#pragma mark - Methods
/**
 元坊SDK
 */
- (void)yf {
    self.splashManager = [[YFSplashManager alloc] initWithConfig:^(YFSplashConfig * _Nonnull config) {
        config.shouldShowLogo = YES;
        config.logoSize = CGSizeMake(self.view.bounds.size.width, 70.f);
        config.logoImage = [UIImage imageNamed:@"app_logo"];
        config.adSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 70);
        config.backgroundImage = [UIImage imageNamed:@"launch_image"];
    }];
    self.splashManager.delegate = self;
}

#pragma mark - Lazyload
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        if (@available(iOS 15.0, *)) {
            _tableView.sectionHeaderTopPadding = 0;
        }
    }
    return _tableView;
}
- (NSArray<NSDictionary<NSString *,NSString *> *> *)dataArr {
    if (!_dataArr) {
        _dataArr = @[
            @{@"title":@"开屏演示", @"index": @(0)},
        ];
    }
    return _dataArr;
}
- (UIImage *)getLaunchImage {
    UIViewController *stvc = [[UIStoryboard storyboardWithName:@"Launch Screen" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    //通过控制器的.view生成imgae截图
    CGRect rect = stvc.view.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [stvc.view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
