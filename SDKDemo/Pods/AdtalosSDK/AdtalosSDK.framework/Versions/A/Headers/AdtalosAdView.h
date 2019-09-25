//
//  AdtalosAdView.h
//  Pods
//
//  Created by 马秉尧 on 2019/8/13.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

#ifndef AdtalosAdView_h
#define AdtalosAdView_h

#import <AdtalosSDK/AdtalosListener.h>
#import <AdtalosSDK/AdtalosVideoController.h>

@interface AdtalosAdView : UIView

@property (nonatomic, assign) BOOL carouselModeEnabled;
@property (getter=delegate, setter=setDelegate:) id<AdtalosListener> delegate;
- (id<AdtalosListener>) delegate;
- (void) setDelegate:(id<AdtalosListener>)delegate;
- (AdtalosVideoController *) videoController;
- (void) loadAd:(NSString *)adUnitId;
- (void) loadAd:(NSString *)adUnitId autoShow:(BOOL)autoShow;
- (BOOL) isLoaded;
- (void) show;
- (void) render;
- (void) impressionReport;

@end

#endif /* AdtalosAdView_h */
