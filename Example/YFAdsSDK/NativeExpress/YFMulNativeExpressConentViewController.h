//
//  YFMulNativeExpressConentViewController.h
//  YFAdsSDK_Example
//
//  Created by Jentle-Zhi on 2024/3/17.
//  Copyright © 2024 jt.zhi. All rights reserved.
//

#import "YFBaseViewController.h"
#import <YFAdsSDK/YFNativeRenderManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFMulNativeExpressConentViewController : YFBaseViewController<YFNativeRenderDelegate>

@property(nonatomic, assign) NSInteger actionIndex;

@property(nonatomic, copy) NSString *posId;

@end

NS_ASSUME_NONNULL_END
