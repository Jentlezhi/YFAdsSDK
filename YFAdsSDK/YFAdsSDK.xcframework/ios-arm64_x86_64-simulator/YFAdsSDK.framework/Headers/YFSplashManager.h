//
//  YFSplashManager.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/3/22.
//

#import <UIKit/UIKit.h>
#import <YFAdsSDK/YFCommon.h>
#import <YFAdsSDK/YFSplashConfig.h>
#import <YFAdsSDK/YFSplashDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFSplashManager : NSObject

@property(nonatomic, weak) id<YFSplashDelegate> delegate;
/// 当前广告商类型
@property(nonatomic, assign, readonly) YFSupplierType currentSupplierType;
/**
 初始化开屏广告
 */
- (instancetype)initWithConfig:(void(^)(YFSplashConfig *config))configBlock;
/**
 加载广告数据
 */
- (void)loadData;
/**
 显示广告
 */
- (void)showSplash;

@end

NS_ASSUME_NONNULL_END
