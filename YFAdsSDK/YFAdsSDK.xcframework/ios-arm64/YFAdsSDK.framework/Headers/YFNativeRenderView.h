//
//  YFNativeRenderView.h
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/29.
//

#import <UIKit/UIKit.h>
#import <YFAdsSDK/YFNativeRenderObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFNativeRenderView : UIView

@property(nonatomic, strong, nullable, readonly) UIView *videoView;
/**
 视图初始化
 @param frame          视频播放器frame
 @return               原生渲染对象
 */
- (instancetype)initWithVideoFrame:(CGRect)frame;
/**
 响应点击事情的视图-子类实现
 */
- (NSArray <UIView*> *)clickedViews;
/**
 开始播放
 */
- (void)play;

/**
 继续播放
 */
- (void)resume;

/**
 暂停播放
 */
- (void)pause;

/**
 销毁播放器
 */
- (void)stop;

/**
 重新播放
 */
- (void)replay;

@end

NS_ASSUME_NONNULL_END
