//
//  BannerAdViewController.swift
//  SDKSwiftDemo
//
//  Created by 马秉尧 on 2019/10/17.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

import Foundation

import UIKit
import AdtalosSDK

class BannerAdViewController: UIViewController, AdtalosListener {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let bannerAdView: AdtalosAdView = AdtalosAdView(frame: CGRectMakeWithAdtalosBannerAdSize(0, 50))
        bannerAdView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        bannerAdView.loadAd("209A03F87BA3B4EB82BEC9E5F8B41383")
        bannerAdView.delegate = self
        view.addSubview(bannerAdView)

        let closeButton: UIButton = UIButton(type: .roundedRect)
        let x: CGFloat = (UIScreen.main.bounds.size.width - 100) / 2
        let y: CGFloat = (UIScreen.main.bounds.size.height - 100)
        closeButton.frame = CGRect(x: x, y: y, width:100, height:50)
        closeButton.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        closeButton.setTitle("关闭", for: .normal)
        closeButton.setTitleColor(UIColor.white, for: .normal)
        closeButton.backgroundColor = UIColor.red
        closeButton.addTarget(self, action: #selector(closeButtonClick), for: .touchUpInside)
        closeButton.layer.masksToBounds = true
        closeButton.layer.cornerRadius = 10.0
        view.addSubview(closeButton)
    }

    @objc func closeButtonClick() {
        dismiss(animated: true, completion: nil)
    }
    
    func onAdRendered() {
        NSLog("Adtalos onAdRendered")
    }

    func onAdImpressionFinished() {
        NSLog("Adtalos onAdImpressionFinished")
    }

    func onAdImpressionReceivedError(_ error: Error!) {
        NSLog("Adtalos onAdImpressionReceivedError")
    }
    
    func onAdLoaded() {
        NSLog("Adtalos onAdLoaded")
    }

    func onAdFailed(toLoad error: Error!) {
        NSLog("Adtalos onAdImpressionReceivedError")
    }

    func onAdClicked() {
        NSLog("Adtalos onAdClicked")

    }

    func onAdLeftApplication() {
        NSLog("Adtalos onAdLeftApplication")
    }

    func  onAdOpened() {
        NSLog("Adtalos onAdOpened")
    }

    func onAdClosed() {
        NSLog("Adtalos onAdClosed")
    }
}
