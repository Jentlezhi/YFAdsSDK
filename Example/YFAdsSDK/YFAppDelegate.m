//
//  AppDelegate.m
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/21.
//

#import "YFAppDelegate.h"
#import "YFViewController.h"
#import <YFAdsSDK/YFAdsManager.h>
#import <YFAdsSDK/YFSplashManager.h>
#import <YFAdsSDK/YFLogManager.h>

@interface YFAppDelegate ()<YFSplashDelegate>
///强引用广告对象，否则会被释放无法正常显示
@property(nonatomic, strong) YFSplashManager *splashManager;
@end

@implementation YFAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:YFViewController.new];
    self.window.rootViewController = nav;
    ///关闭日志输出
    YFLogManager.logEnable = YES;
    ///初始化SDK
    [YFAdsManager initSDKWithAppId:@"431479" apikey:@"7caj76pdv6em6" appName:@"test" bundleId:@"com.sina.tianqitong"];
//    [self yf];
//    [self.splashManager loadData];
    [self.window makeKeyAndVisible];
    return YES;
}
/**
 元坊SDK
 */
- (void)yf {
    self.splashManager = [[YFSplashManager alloc] initWithConfig:^(YFSplashConfig * _Nonnull config) {
        config.posId = @"52843544";
        config.shouldShowLogo = YES;
        config.logoSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 70.f);
        config.logoImage = [UIImage imageNamed:@"app_logo"];
        config.adSize = CGSizeMake(CGRectGetWidth(UIScreen.mainScreen.bounds), CGRectGetHeight(UIScreen.mainScreen.bounds) - 70);
        config.backgroundImage = [UIImage imageNamed:@"launch_image"];
        config.timeOut = 4;
    }];
    self.splashManager.delegate = self;
}

/**
 广告数据加载成功
 */
- (void)adsDidLoadSuccess:(YFSplashManager *)manger {
    ///显示广告
    [self.splashManager showSplash];
}

@end

