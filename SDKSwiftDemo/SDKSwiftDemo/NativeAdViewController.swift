//
//  NativeAdViewController.swift
//  SDKSwiftDemo
//
//  Created by 马秉尧 on 2019/10/18.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

import Foundation

import UIKit
import AdtalosSDK

class NativeAdViewController: UIViewController, AdtalosListener, AdtalosVideoListener {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let frame: CGRect = CGRectMakeWithAdtalosNative7to5AdSize(0, 50)
        let adView: AdtalosAdView = AdtalosAdView(frame: frame)
        adView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        adView.loadAd("98738D91D3BB241458D3FAE5A5BF7B34")
        adView.delegate = self
        adView.videoController.delegate = self;
        view.addSubview(adView)

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
    
    func onVideoLoad(_ metadata: [AnyHashable : Any]!) {
        NSLog("Adtalos onVideoLoad: %@", metadata);
    }

    func onVideoStart() {
        NSLog("Adtalos onVideoStart");
    }

    func onVideoPlay() {
        NSLog("Adtalos onVideoPlay");
    }

    func onVideoPause() {
        NSLog("Adtalos onVideoPause");
    }

    func onVideoEnd() {
        NSLog("Adtalos onVideoEnd");
    }

    func onVideoVolumeChange(_ volume: Double, muted: Bool) {
        NSLog("Adtalos onVideoVolumeChange: %f, %d", volume, muted);
    }

    func onVideoTimeUpdate(_ currentTime: Double, duration: Double) {
        NSLog("Adtalos onVideoTimeUpdate: %f, %f", currentTime, duration);
    }

    func onVideoError() {
        NSLog("Adtalos onVideoError");
    }

    func onVideoBreak() {
        NSLog("Adtalos onVideoBreak");
    }
}
