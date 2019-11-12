//
//  AdtalosInterstitialAd.h
//  Pods
//
//  Created by 马秉尧 on 2019/9/9.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

#ifndef AdtalosInterstitialAd_h
#define AdtalosInterstitialAd_h

#import <AdtalosSDK/AdtalosListener.h>

typedef NS_ENUM(int, AdtalosAdType) {
    AdtalosAdTypeInterstitial         = 0,
    AdtalosAdTypeSplash               = 1,
    AdtalosAdTypeRewardedVideo        = 2
};

@interface AdtalosInterstitialAd : NSObject

@property (nonatomic, weak) id<AdtalosListener> delegate;
@property (nonatomic, weak) id<AdtalosVideoListener> videoDelegate;
@property (nonatomic, readonly) NSMutableDictionary<NSString *, AdtalosCustomEvent> *customEvents;
- (instancetype) init:(NSString *)adUnitId;
- (instancetype) init:(NSString *)adUnitId withAdType:(AdtalosAdType)adType;
- (BOOL) isLoaded;
- (void) show;
- (void) show:(long)timeout;
- (void) autoRetry:(NSInteger)times;

@end

#endif /* AdtalosInterstitialAd_h */
