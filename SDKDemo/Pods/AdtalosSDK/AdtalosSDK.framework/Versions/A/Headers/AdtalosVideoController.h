//
//  AdtalosVideoController.h
//  Pods
//
//  Created by 马秉尧 on 2019/8/28.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

#ifndef AdtalosVideoController_h
#define AdtalosVideoController_h

#import <WebKit/WebKit.h>

#import <AdtalosSDK/AdtalosListener.h>

typedef NS_ENUM(int, AdtalosVideoMetadataType) {
    AdtalosVideoMetadataTypeFirstPlay    = 1,
    AdtalosVideoMetadataTypeContinuePlay = 2,
    AdtalosVideoMetadataTypeReplay       = 3,
};

typedef NS_ENUM(int, AdtalosVideoMetadataStatus) {
    AdtalosVideoMetadataStatusNormal  = 0,
    AdtalosVideoMetadataStatusLoading = 1,
    AdtalosVideoMetadataStatusError   = 2,
};

@interface AdtalosVideoController : NSObject

@property (nonatomic, weak) id<AdtalosVideoListener> delegate;

- (instancetype) initWithWebView:(WKWebView *)webView;
- (void) play;
- (void) pause;
- (void) mute:(BOOL)mute;
- (BOOL) isPlaying;
- (BOOL) isEnded;
@property (getter=metadata, readonly) NSDictionary *metadata;
- (NSDictionary *) metadata;
- (BOOL) hasVideo;

@end

#endif /* AdtalosVideoController_h */
