//
//  YFAdsManager.h
//  YFAdsSDK
//
//  Created by Jentle-Zhi on 2024/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFAdsManager : NSObject

@property(nonatomic, copy, class, readonly) NSString *appId;

@property(nonatomic, copy, class, readonly) NSString *apikey;

@property(nonatomic, copy, class, readonly) NSString *appName;

@property(nonatomic, copy, class, readonly) NSString *bundleId;

/**
 初始化SDK
 @param appId       应用ID
 @param apikey      api秘钥
 @param appName     app名称
 @param bundleId    iOS包名
 */
+ (void)initSDKWithAppId:(NSString *)appId
                  apikey:(NSString *)apikey
                 appName:(NSString *)appName
                bundleId:(NSString *)bundleId;

@end

NS_ASSUME_NONNULL_END
