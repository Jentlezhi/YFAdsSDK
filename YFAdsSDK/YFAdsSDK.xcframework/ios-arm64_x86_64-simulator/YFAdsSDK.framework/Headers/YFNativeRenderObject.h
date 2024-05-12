//
//  YFNativeRenderObject.h
//  YFAdsSDKDemo
//
//  Created by Jentle-Zhi on 2024/3/29.
//

#import <Foundation/Foundation.h>
#import <YFAdsSDK/YFCommon.h>

typedef NS_ENUM(NSInteger, YFNativeRenderMaterialType) {
    //未知类型，超范围
    YFMaterialTypeUnknown = -1,
    // 一般图文或图片广告
    YFMaterialTypeNormal = 0,
    // 视频广告，需开发者增加播放器支持
    YFMaterialTypeVideo,
    // html模版广告
    YFMaterialTypeHTML,
};

typedef NS_ENUM(NSInteger, YFNativeRenderActionType) {
    // 未知类型，超范围
    YFActionTypeUnknown = -1,
    // 落地页广告
    YFActionTypeWeb = 1,
    // 下载类广告
    YFActionTypeDL = 2,
    // 唤醒类广告
    YFActionTypeDLink = 3
};

typedef NS_ENUM(NSUInteger, YFNativeRenderShowType) {
    ///实时竞价
    YFNativeRenderShowTypeBidding,
    ///瀑布流
    YFNativeRenderShowTypeWaterfall,
};

NS_ASSUME_NONNULL_BEGIN

@interface YFNativeRenderObject : NSObject
/// 供应商类型
@property(nonatomic, assign) YFSupplierType supplierType;
/// 媒体类型
@property(nonatomic, assign) YFNativeRenderMaterialType materialType;
/// 广告触发行为类型
@property(nonatomic, assign) YFNativeRenderActionType actionType;
/// 广告标题，短文字
@property(nonatomic, copy) NSString *title;
/// 按钮标题
@property(nonatomic, copy) NSString *actionTitle;
/// 广告描述，长文字
@property(nonatomic, copy) NSString *desc;
/// icon图片地址
@property(nonatomic, copy) NSString *iconUrl;
/// 广告logo URL
@property(nonatomic, copy) NSString *logoUrl;
/// 单图地址
@property(nonatomic, copy) NSString *imageUrl;
/// 单图素材的宽度
@property(nonatomic, assign) CGFloat imageWidth;
/// 单图素材的高度
@property(nonatomic, assign) CGFloat imageHeight;
/// 多图地址
@property(nonatomic, strong) NSArray *imageUrlList;
/// 视频地址
@property(nonatomic, copy) NSString *videoUrl;
/// 视频素材的时长 单位s
@property(nonatomic, assign) NSInteger videoDuration;
/// 应用名称
@property(nonatomic, copy) NSString *appName;
/// 开发者名称
@property(nonatomic, copy) NSString *publisher;
/// 广告是否过期
@property(nonatomic, assign) BOOL isExpired;
/// 广告的价格
@property(nonatomic, assign) NSInteger eCPM;
/// 广告底价范围
@property(nonatomic, assign) NSInteger eCPMLevel;

@end

NS_ASSUME_NONNULL_END
