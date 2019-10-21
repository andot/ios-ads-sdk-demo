//
//  AdtalosListener.h
//  Pods
//
//  Created by 马秉尧 on 2019/8/16.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

#ifndef AdtalosListener_h
#define AdtalosListener_h

typedef void (^AdtalosCustomEvent)(NSString *data);

@protocol AdtalosListener <NSObject>

@optional
- (void) onAdRendered;
- (void) onAdImpressionFinished;
- (void) onAdImpressionReceivedError:(NSError *)error;
- (void) onAdLoaded;
- (void) onAdFailedToLoad:(NSError *)error;
- (void) onAdClicked;
- (void) onAdLeftApplication;
- (void) onAdOpened;
- (void) onAdClosed;
- (void) onAdCustomEvent:(NSString *)name withData:(NSString *)data;

@end

@protocol AdtalosVideoListener <NSObject>

@optional
- (void) onVideoLoad:(NSDictionary *)metadata;
- (void) onVideoStart;
- (void) onVideoPlay;
- (void) onVideoPause;
- (void) onVideoEnd;
- (void) onVideoVolumeChange:(double)volume muted:(BOOL)muted;
- (void) onVideoTimeUpdate:(double)currentTime duration:(double)duration;
- (void) onVideoError;
- (void) onVideoBreak;

@end

#endif /* AdtalosListener_h */
