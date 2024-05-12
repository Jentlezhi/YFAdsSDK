//
//  YFLogManager.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/4/20.
//

#import <Foundation/Foundation.h>
#import <YFAdsSDK/YFCommon.h>

typedef NS_ENUM(NSUInteger, YFErrorCode) {
    //广告返回的数据为空，一般为渠道广告无填充。
    YFErrorEmptyData = 9901,
    //加载某个SDK渠道时发生异常
    YFErrorLoadError = 9902,
    //展示某个SDK渠道时发生异常
    YFErrorExposeError = 9903,
    //渲染某个SDK渠道时发生异常
    YFErrorRenderError = 9904,
    //当前策略中无有效的SDK渠道，或渠道信息为空
    YFErrorInvalidInfo = 9905,
    //未获取到策略
    YFErrorNoPolicy = 9907,
    //某个SDK渠道启动异常
    YFErrorLaunchError = 9908,
    //穿山甲渠道SDK加载超时
    YFErrorCSJTimeOut = 9910,
    //百度SDK加载失败
    YFErrorBDTimeOut = 9911,
    //快手SDK加载失败，广告位id类型转换异常
    YFErrorKSLoadError = 9912,
    //快手SDK初始化失败
    YFErrorKSInitError = 9914,
    //原生渲染-渲染失败
    YFErrorNativeRenderError = 9915,
};

NS_ASSUME_NONNULL_BEGIN

@interface YFLogManager : NSObject

/// 默认开启日志输出
@property(nonatomic, assign, class) BOOL logEnable;

+ (void)logWithCode:(YFErrorCode)code
       supplierType:(YFSupplierType)type
            message:(NSString *)msg
              error:(nullable NSError *)error
           otherMsg:(nullable NSString *)otherMsg;

@end

NS_ASSUME_NONNULL_END
