//
//  YFSplashSupplierDelegate.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/4/7.
//

#import <Foundation/Foundation.h>

@class YFSplashManager;

NS_ASSUME_NONNULL_BEGIN

@protocol YFSplashDelegate <NSObject>
@optional
/**
 开屏广告开始请求
 */
- (void)adsBeginLoad:(YFSplashManager *)manager;
/**
 广告数据加载成功
 */
- (void)adsDidLoadSuccess:(YFSplashManager *)manager;
/**
 广告数据加载失败
 */
- (void)adsDidLoadFail:(YFSplashManager *)manager;
/**
 广告将要展示
 */
- (void)adsWillShow:(YFSplashManager *)manager;
/**
 广告点击
 */
- (void)adsDidClicked:(YFSplashManager *)manager;
/**
 广告曝光成功
 */
- (void)adsDidExposuredSuccess:(YFSplashManager *)manager;
/**
 广告曝光失败(仅穿山甲有此回调)
 */
- (void)adsDidExposuredFail:(YFSplashManager *)manager;
/**
 跳过按钮被点击(仅快手有此回调)
 */
- (void)splashSkipButtonDidClicked:(YFSplashManager *)manager;
/**
 广告关闭
 */
- (void)adsDidClosed:(YFSplashManager *)manager;
/**
 广告倒计时结束回调
 */
- (void)splashCountdownToZero:(YFSplashManager *)manager;

@end

NS_ASSUME_NONNULL_END
