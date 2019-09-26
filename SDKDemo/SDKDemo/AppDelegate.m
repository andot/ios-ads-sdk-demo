//
//  AppDelegate.m
//  SDKDemo
//
//  Created by 马秉尧 on 2019/9/25.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

@import AdtalosSDK;

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    AdtalosSplashAd *splashAd;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    splashAd = [[AdtalosSplashAd alloc] init:@"5C3DD65A809B08A2D6CF3DEFBC7E09C7"];
    [splashAd show];
    return YES;
}

@end
