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

- (AdtalosAdType) adType;
- (instancetype) init:(NSString *)adUnitId;
@property (getter=delegate, setter=setDelegate:) id<AdtalosListener> delegate;
- (id<AdtalosListener>) delegate;
- (void) setDelegate:(id<AdtalosListener>)delegate;
@property (getter=videoDelegate, setter=setVideoDelegate:) id<AdtalosVideoListener> videoDelegate;
- (id<AdtalosVideoListener>) videoDelegate;
- (void) setVideoDelegate:(id<AdtalosVideoListener>)videoDelegate;
- (BOOL) isLoaded;
- (void) show;
- (void) show:(long)timeout;

@end

#endif /* AdtalosInterstitialAd_h */
