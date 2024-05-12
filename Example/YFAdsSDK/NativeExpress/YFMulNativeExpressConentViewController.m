//
//  YFMulNativeExpressConentViewController.m
//  YFAdsSDK_Example
//
//  Created by Jentle-Zhi on 2024/3/17.
//  Copyright © 2024 jt.zhi. All rights reserved.
//

#import "YFMulNativeExpressConentViewController.h"
#import "Masonry.h"
#import <YFAdsSDK/YFNativeRenderManager.h>
#import "YYFNativeRenderVideoDemoView.h"
#import "YYFNativeRenderNormalDemoView.h"


@interface YFMulNativeExpressConentViewController ()<YFNativeRenderDelegate>
///强引用nativeRenderManager，避免提前释放
@property(nonatomic, strong) YFNativeRenderManager *nativeRenderManager;
@property(nonatomic, strong) YYFNativeRenderVideoDemoView *renderVideoView;
@property(nonatomic, strong) YYFNativeRenderNormalDemoView *renderNormalView;
@end

@implementation YFMulNativeExpressConentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self yfNavtiveRender];
}
#pragma mark - Methods
- (void)yfNavtiveRender {
   self.nativeRenderManager = [[YFNativeRenderManager alloc] initWithConfig:^(YFNativeRenderConfig * _Nonnull config) {
       config.presentAdViewController = self;
       config.videoMute = NO;
       config.posId = self.posId;
    }];
    self.nativeRenderManager.delegate = self;
    [self.nativeRenderManager loadData];
}

#pragma mark - YFNativeRenderDelegate
/**
 广告开始发起请求
 */
- (void)adsBeginLoad:(YFNativeRenderManager *)manager {
    NSLog(@"adsBeginLoad -- type: %lu",(unsigned long)manager.currentSupplierType);
}
/**
 自渲染广告数据加载成功
 */
- (void)adDataDidLoadSuccess:(YFNativeRenderManager *)manger renderObject:(YFNativeRenderObject *)renderObject {
    NSLog(@"adDataDidLoadSuccess -- type: %lu",(unsigned long)manger.currentSupplierType);
}
/**
 自渲染广告数据加载失败
 */
- (void)adDataDidLoadFail:(YFNativeRenderManager *)manger error:(NSError *)error {
    NSLog(@"adDataDidLoadFail -- type: %lu",(unsigned long)manger.currentSupplierType);
}
/**
 广告曝光成功
 */
- (void)adDidExposedSuccess:(YFNativeRenderManager *)manger {
    NSLog(@"adDidExposedSuccess -- type: %lu",(unsigned long)manger.currentSupplierType);
}
/**
 广告曝光失败
 */
- (void)adDidExposedFail:(YFNativeRenderManager *)manger error:(NSError *)error {
    NSLog(@"adDidExposedFail -- type: %lu",(unsigned long)manger.currentSupplierType);
}
/**
 自定义渲染视图
 */
- (nullable __kindof YFNativeRenderView *)nativeRenderViewWithManger:(YFNativeRenderManager * _Nonnull)manger renderObject:(YFNativeRenderObject *_Nullable)renderObject {
    ///加载失败
    if(renderObject == nil) {
        return nil;
    }
    ///视频
    if (renderObject.materialType == YFMaterialTypeVideo) {
        CGFloat hwr = 1.f;
        if (renderObject.imageWidth) {
            hwr = renderObject.imageHeight/renderObject.imageWidth;
        }
        CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
        CGFloat height = screenWidth*hwr;
        self.renderVideoView = [[YYFNativeRenderVideoDemoView alloc] initWithVideoFrame:CGRectMake(0, 0, screenWidth, height)];
        [self.view addSubview:self.renderVideoView];
        [self.renderVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.right.equalTo(self.view);
        }];
        self.renderVideoView.object = renderObject;
        [self.renderVideoView play];
        return self.renderVideoView;
    }
    ///其他非视频
    self.renderNormalView = [YYFNativeRenderNormalDemoView new];
    self.renderNormalView.object = renderObject;
    [self.view addSubview:self.renderNormalView];
    [self.renderNormalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
    }];
    return self.renderNormalView;
}
/**
 广告被点击
 */
- (void)adClicked:(YFNativeRenderManager *)manger renderObject:(YFNativeRenderObject *)renderObject {
    NSLog(@"广告被点击%lu",(long)renderObject.supplierType);
}
/**
 广告详情关闭
 */
- (void)adDetailDidClosed:(YFNativeRenderManager *)manger
             nativeAdView:(UIView *)nativeAdView {
    NSLog(@"adDetailDidClosed - %@",nativeAdView);
}
/**
 视频广告播放完毕
 */
- (void)adVideoDidFinishPlay:(YFNativeRenderManager *)manger renderObject:(nonnull YFNativeRenderObject *)renderObject {
    NSLog(@"视频广告播放完毕%lu",(long)renderObject.supplierType);
}
/**
 视频广告播放失败
 */
- (void)adVideoDidPlayFail:(YFNativeRenderManager *)manger renderObject:(YFNativeRenderObject *)renderObject error:(NSError *)error {
    NSLog(@"视频广告播放失败%@",error);
}
- (void)dealloc {
    NSLog(@"dealloc");
}

@end
