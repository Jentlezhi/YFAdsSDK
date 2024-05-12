//
//  YFNativeRenderManager.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/3/27.
//

#import <UIKit/UIKit.h>
#import <YFAdsSDK/YFNativeRenderDelegate.h>
#import <YFAdsSDK/YFNativeRenderConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFNativeRenderManager : NSObject

///代理
@property(nonatomic, weak) id<YFNativeRenderDelegate> delegate;
/// 当前广告商类型
@property(nonatomic, assign, readonly) YFSupplierType currentSupplierType;
/**
 初始化
 */
- (instancetype)initWithConfig:(void(^)(YFNativeRenderConfig *config))configBlock;
/**
 加载数据
 */
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
