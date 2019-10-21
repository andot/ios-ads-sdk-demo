//
//  AppDelegate.swift
//  SDKSwiftDemo
//
//  Created by 马秉尧 on 2019/10/16.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

import UIKit
import AdtalosSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var splashAd: AdtalosSplashAd = AdtalosSplashAd("5C3DD65A809B08A2D6CF3DEFBC7E09C7")
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        splashAd.show()
        return true
    }

}
