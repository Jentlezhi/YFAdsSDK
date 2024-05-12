//
//  YFNativeRenderConfig.h
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/29.
//

#import <UIKit/UIKit.h>
#import <YFAdsSDK/YFCommon.h>

NS_ASSUME_NONNULL_BEGIN
///===========================================================
/// YFNativeRenderSupplier
///===========================================================
@interface YFNativeRenderSupplier : NSObject
/// 广告商类型
@property(nonatomic, assign, readonly) YFSupplierType supplierType;
/// 应用的appId
@property(nonatomic, copy, nonnull) NSString *appId;
/// 广告位id
@property(nonatomic, copy, nonnull) NSString *adspotId;
/// 渠道id
@property(nonatomic, copy, nullable) NSString *channelId;

@end
///===========================================================
/// YFNativeRenderConfig
///===========================================================
@interface YFNativeRenderConfig : NSObject
/// 元坊posId
@property(nonatomic, copy, nonnull) NSString *posId;
/// 竞价类型
@property(nonatomic, assign, readonly) YFAdsShowType showType;
/// 传入用来展示广告详情页的viewcontroller
@property(nonatomic, weak) UIViewController *presentAdViewController;
/// 自动播放视频，默认YES（快手自渲染默认自动播放，且不可设置）
@property(nonatomic, assign) BOOL autoPlayVideo;
/// 视频是否静音，默认YES
@property(nonatomic, assign) BOOL videoMute;

@end

NS_ASSUME_NONNULL_END
