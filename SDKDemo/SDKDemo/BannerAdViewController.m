//
//  BannerAdViewController.m
//  SDKDemo
//
//  Created by 马秉尧 on 2019/9/25.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

@import AdtalosSDK;

#import "BannerAdViewController.h"

@interface BannerAdViewController ()<AdtalosListener>

- (void) onAdRendered;
- (void) onAdImpressionFinished;
- (void) onAdImpressionReceivedError:(NSError *)error;
- (void) onAdLoaded;
- (void) onAdFailedToLoad:(NSError *)error;
- (void) onAdClicked;
- (void) onAdLeftApplication;
- (void) onAdOpened;
- (void) onAdClosed;

@end

@implementation BannerAdViewController {
    AdtalosAdView *bannerAdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    bannerAdView = [[AdtalosAdView alloc] initWithFrame:CGRectMakeWithAdtalosBannerAdSize(0, 50)];
    bannerAdView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [bannerAdView loadAd: @"209A03F87BA3B4EB82BEC9E5F8B41383"];
    bannerAdView.delegate = self;
    [self.view addSubview:bannerAdView];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    bannerAdView = nil;
    // Dispose of any resources that can be recreated.
}

@end
