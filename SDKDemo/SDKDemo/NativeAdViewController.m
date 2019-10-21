//
//  NativeAdViewController.m
//  SDKDemo
//
//  Created by 马秉尧 on 2019/9/25.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

@import AdtalosSDK;

#import "NativeAdViewController.h"

@interface NativeAdViewController ()<AdtalosListener, AdtalosVideoListener>

- (void) onAdRendered;
- (void) onAdImpressionFinished;
- (void) onAdImpressionReceivedError:(NSError *)error;
- (void) onAdLoaded;
- (void) onAdFailedToLoad:(NSError *)error;
- (void) onAdClicked;
- (void) onAdLeftApplication;
- (void) onAdOpened;
- (void) onAdClosed;

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

@implementation NativeAdViewController {
    AdtalosAdView *adView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect frame = CGRectMakeWithAdtalosNative7to5AdSize(0, 50);
    adView = [[AdtalosAdView alloc] initWithFrame:frame];
    adView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [adView loadAd: @"98738D91D3BB241458D3FAE5A5BF7B34"];
    adView.delegate = self;
    adView.videoController.delegate = self;
    [self.view addSubview:adView];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 100) / 2;
    CGFloat y = [UIScreen mainScreen].bounds.size.height - 100;
    closeButton.frame = CGRectMake(x, y, 100, 50);
    closeButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [closeButton setBackgroundColor:[UIColor redColor]];
    [closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton.layer setMasksToBounds:YES];
    [closeButton.layer setCornerRadius:10.0];
    [self.view addSubview:closeButton];
}

- (void)closeButtonClick:(UIButton *)button {
    [adView.videoController pause];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) onAdRendered {
    NSLog(@"Adtalos onAdRendered");
}

- (void) onAdImpressionFinished {
    NSLog(@"Adtalos onAdImpressionFinished");
}

- (void) onAdImpressionReceivedError:(NSError *)error {
    NSLog(@"Adtalos onAdImpressionReceivedError: %@", error);
}

- (void) onAdLoaded {
    NSLog(@"Adtalos onAdLoaded");
}

- (void) onAdFailedToLoad:(NSError *)error {
    NSLog(@"Adtalos onAdFailedToLoad: %@", error);
}

- (void) onAdClicked {
    NSLog(@"Adtalos onAdClicked");

}

- (void) onAdLeftApplication {
    NSLog(@"Adtalos onAdLeftApplication");
}

- (void) onAdOpened {
    NSLog(@"Adtalos onAdOpened");
}

- (void) onAdClosed {
    NSLog(@"Adtalos onAdClosed");
}

- (void) onVideoLoad:(NSDictionary *)metadata {
    NSLog(@"Adtalos onVideoLoad: %@", metadata);
}

- (void) onVideoStart {
    NSLog(@"Adtalos onVideoStart");
}

- (void) onVideoPlay {
    NSLog(@"Adtalos onVideoPlay");
}

- (void) onVideoPause {
    NSLog(@"Adtalos onVideoPause");
}

- (void) onVideoEnd {
    NSLog(@"Adtalos onVideoEnd");
}

- (void) onVideoVolumeChange:(double)volume muted:(BOOL)muted {
    NSLog(@"Adtalos onVideoVolumeChange: %f, %d", volume, muted);

}

- (void) onVideoTimeUpdate:(double)currentTime duration:(double)duration {
    NSLog(@"Adtalos onVideoTimeUpdate: %f, %f", currentTime, duration);
}

- (void) onVideoError {
    NSLog(@"Adtalos onVideoError");
}

- (void) onVideoBreak {
    NSLog(@"Adtalos onVideoBreak");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    adView = nil;
    // Dispose of any resources that can be recreated.
}

@end
