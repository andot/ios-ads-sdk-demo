//
//  ViewController.m
//  SDKDemo
//
//  Created by 马秉尧 on 2019/9/25.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

@import AdtalosSDK;
#import "ViewController.h"
#import "BannerAdViewController.h"
#import "NativeAdViewController.h"

@interface ViewController ()<AdtalosListener, AdtalosVideoListener>

- (void) onAdRendered;
- (void) onAdImpressionFinished;
- (void) onAdImpressionFailed;
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


@implementation ViewController {
    AdtalosInterstitialAd *interstitialAd;
    AdtalosRewardedVideoAd *rewardedVideoAd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    interstitialAd = [[AdtalosInterstitialAd alloc] init:@"2EF810225D10260506CBB704C96C5325"];
    interstitialAd.delegate = self;

    rewardedVideoAd = [[AdtalosRewardedVideoAd alloc] init:@"4A11FDDB78AAAC06536DFDEA120CF5D0"];
    rewardedVideoAd.delegate = self;
    rewardedVideoAd.videoDelegate = self;

    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 160) / 2;
    CGFloat y = [UIScreen mainScreen].bounds.size.height / 2;

    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(x, y - 200, 160, 50);
    button1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button1 setTitle:@"打开横幅广告" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor systemBlueColor]];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [button1.layer setMasksToBounds:YES];
    [button1.layer setCornerRadius:10.0];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(x, y - 100, 160, 50);
    button2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button2 setTitle:@"打开原生广告" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor systemBlueColor]];
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [button2.layer setMasksToBounds:YES];
    [button2.layer setCornerRadius:10.0];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(x, y, 160, 50);
    button3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button3 setTitle:@"打开插屏广告" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor systemBlueColor]];
    [button3 addTarget:self action:@selector(button3Click:) forControlEvents:UIControlEventTouchUpInside];
    [button3.layer setMasksToBounds:YES];
    [button3.layer setCornerRadius:10.0];
    [self.view addSubview:button3];

    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(x, y + 100, 160, 50);
    button4.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button4 setTitle:@"打开激励视频" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor systemBlueColor]];
    [button4 addTarget:self action:@selector(button4Click:) forControlEvents:UIControlEventTouchUpInside];
    [button4.layer setMasksToBounds:YES];
    [button4.layer setCornerRadius:10.0];
    [self.view addSubview:button4];
}

- (void)button1Click:(UIButton *)button {
    BannerAdViewController *vc = [BannerAdViewController new];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)button2Click:(UIButton *)button {
    NativeAdViewController *vc = [NativeAdViewController new];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)button3Click:(UIButton *)button {
    [interstitialAd show];
}

- (void)button4Click:(UIButton *)button {
    [rewardedVideoAd show];
}

- (void) onAdRendered {
    NSLog(@"Adtalos onAdRendered");
}

- (void) onAdImpressionFinished {
    NSLog(@"Adtalos onAdImpressionFinished");
}

- (void) onAdImpressionFailed {
    NSLog(@"Adtalos onAdImpressionFailed");
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
    interstitialAd = nil;
    rewardedVideoAd = nil;
}

@end
