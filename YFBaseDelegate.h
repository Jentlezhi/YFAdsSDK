//
//  YFBaseProtocol.h
//  LookinServer
//
//  Created by Jentle-Zhi on 2024/3/14.
//

#import <Foundation/Foundation.h>

@class YFBaseAdapter;

NS_ASSUME_NONNULL_BEGIN

@protocol YFBaseDelegate <NSObject>

@optional
/// 广告数据加载成功
- (void)adsDidLoadSuccess:(YFBaseAdapter *)adapter;

/// 广告数据加载失败
- (void)adsDidLoadFail:(YFBaseAdapter *)adapter;

/// 广告点击
- (void)adsDidClicked:(YFBaseAdapter *)adapter;

/// 广告曝光成功
- (void)adsDidExposured:(YFBaseAdapter *)adapter;

/// 广告关闭
- (void)adsDidClosed:(YFBaseAdapter *)adapter;

@end

NS_ASSUME_NONNULL_END
