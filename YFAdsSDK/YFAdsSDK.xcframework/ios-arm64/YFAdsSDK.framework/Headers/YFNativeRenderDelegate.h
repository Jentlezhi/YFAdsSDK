//
//  YFNativeRenderDelegate.h
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/29.
//

#import <UIKit/UIKit.h>
//#import "YFNativeRenderView.h"
//#import "YFNativeRenderManager.h"
//#import "YFNativeRenderObject.h"

@class YFNativeRenderView,YFNativeRenderManager,YFNativeRenderObject;

NS_ASSUME_NONNULL_BEGIN

@protocol YFNativeRenderDelegate <NSObject>

@required
/**
 自定义渲染视图
 */
- (nullable __kindof YFNativeRenderView *)nativeRenderViewWithManger:(YFNativeRenderManager * _Nonnull)manger renderObject:(YFNativeRenderObject *_Nullable)renderObject;

@optional
/**
 开屏广告开始请求
 */
- (void)adsBeginLoad:(YFNativeRenderManager *)manager;
/**
 数据加载成功
 */
- (void)adDataDidLoadSuccess:(YFNativeRenderManager *_Nonnull)manger renderObject:(YFNativeRenderObject *)renderObject;
/**
 数据加载失败
 */
- (void)adDataDidLoadFail:(YFNativeRenderManager *_Nonnull)manger error:(nonnull NSError *)error;
/**
 广告曝光成功
 */
- (void)adDidExposedSuccess:(YFNativeRenderManager *_Nonnull)manger;
/**
 广告曝光失败 (仅百青藤有此回调)
 */
- (void)adDidExposedFail:(YFNativeRenderManager *_Nonnull)manger error:(nonnull NSError *)error;
/**
 广告点击
 */
- (void)adClicked:(YFNativeRenderManager *_Nonnull)manger
     renderObject:(YFNativeRenderObject *)renderObject;
/**
 广告详情页关闭
 */
- (void)adDetailDidClosed:(YFNativeRenderManager *_Nonnull)manger nativeAdView:(nullable UIView *)nativeAdView;
/**
 广告视频播放完毕
 */
- (void)adVideoDidFinishPlay:(YFNativeRenderManager *_Nonnull)manger
                renderObject:(YFNativeRenderObject *)renderObject;
/**
 广告视频播放失败
 */
- (void)adVideoDidPlayFail:(YFNativeRenderManager *_Nonnull)manger
              renderObject:(YFNativeRenderObject *)renderObject
                     error:(nullable NSError *)error;
@end

NS_ASSUME_NONNULL_END
