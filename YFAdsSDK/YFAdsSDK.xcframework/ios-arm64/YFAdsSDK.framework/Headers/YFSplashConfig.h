//
//  YFSplashConfig.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/4/7.
//

#import <UIKit/UIKit.h>
#import <YFAdsSDK/YFCommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFSplashConfig : NSObject

/// 元坊posId
@property(nonatomic, copy, nonnull) NSString *posId;
/// 广告尺寸(默认：[UIScreen mainScreen].bounds.size)
@property(nonatomic, assign) CGSize adSize;
/// 默认NO
@property(nonatomic, assign) BOOL shouldShowLogo;
/// 广告背景图
@property(nonatomic, strong, nonnull) UIImage *backgroundImage;
/// logo尺寸
@property(nonatomic, assign) CGSize logoSize;
/// logo图片
@property(nonatomic, strong, nonnull) UIImage *logoImage;
/// 超时时间(默认3s)
@property(nonatomic, assign) NSTimeInterval timeOut;
/// 显示类型
@property(nonatomic, assign, readonly) YFAdsShowType showType;

@end


@interface YFSplashSupplier : NSObject

/// 应用的appId
@property(nonatomic, copy, nonnull) NSString *appId;
/// 广告位id
@property(nonatomic, copy, nonnull) NSString *adspotId;
/// 渠道id
@property(nonatomic, copy, nullable) NSString *channelId;
/// 广告提供商
@property(nonatomic, assign, readonly) YFSupplierType supplierType;

@end

NS_ASSUME_NONNULL_END
