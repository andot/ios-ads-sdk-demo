//
//  ViewController.swift
//  SDKSwiftDemo
//
//  Created by 马秉尧 on 2019/10/16.
//  Copyright © 2019 新义互联（北京）科技有限公司. All rights reserved.
//

import UIKit
import AdtalosSDK

class ViewController: UIViewController, AdtalosListener, AdtalosVideoListener {
    
    var interstitialAd: AdtalosInterstitialAd?
    var rewardedVideoAd: AdtalosRewardedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let x: CGFloat = (UIScreen.main.bounds.size.width - 160) / 2
        let y: CGFloat = UIScreen.main.bounds.size.height / 2
        let button1: UIButton = UIButton(type: .roundedRect)
        button1.frame = CGRect(x: x, y: y - 200, width: 160, height: 50)
        button1.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button1.setTitle("打开横幅广告", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = UIColor.systemBlue;
        button1.addTarget(self, action: #selector(button1Click), for: .touchUpInside)
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 10.0
        view.addSubview(button1)

        let button2: UIButton = UIButton(type: .roundedRect)
        button2.frame = CGRect(x: x, y: y - 100, width: 160, height: 50)
        button2.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button2.setTitle("打开原生广告", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.systemBlue;
        button2.addTarget(self, action: #selector(button2Click), for: .touchUpInside)
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 10.0
        view.addSubview(button2)

        let button3: UIButton = UIButton(type: .roundedRect)
        button3.frame = CGRect(x: x, y: y, width: 160, height: 50)
        button3.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button3.setTitle("打开插屏广告", for: .normal)
        button3.setTitleColor(UIColor.white, for: .normal)
        button3.backgroundColor = UIColor.systemBlue;
        button3.addTarget(self, action: #selector(button3Click), for: .touchUpInside)
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 10.0
        view.addSubview(button3)

        let button4: UIButton = UIButton(type: .roundedRect)
        button4.frame = CGRect(x: x, y: y + 100, width: 160, height: 50)
        button4.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button4.setTitle("打开激励视频", for: .normal)
        button4.setTitleColor(UIColor.white, for: .normal)
        button4.backgroundColor = UIColor.systemBlue;
        button4.addTarget(self, action: #selector(button4Click), for: .touchUpInside)
        button4.layer.masksToBounds = true
        button4.layer.cornerRadius = 10.0
        view.addSubview(button4)
    }

    @objc func button1Click() {
        let vc: BannerAdViewController = BannerAdViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated:true, completion:nil)
    }
    
    @objc func button2Click() {
        let vc: NativeAdViewController = NativeAdViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated:true, completion:nil)
    }
    
    @objc func button3Click() {
        interstitialAd = AdtalosInterstitialAd("2EF810225D10260506CBB704C96C5325")
        interstitialAd!.delegate = self
        interstitialAd!.show()
    }
    
    @objc func button4Click() {
        rewardedVideoAd = AdtalosRewardedVideoAd("4A11FDDB78AAAC06536DFDEA120CF5D0")
        rewardedVideoAd!.delegate = self
        rewardedVideoAd!.videoDelegate = self
        rewardedVideoAd!.show()
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
        NSLog("Adtalos onVideoLoad: %@", metadata)
    }

    func onVideoStart() {
        NSLog("Adtalos onVideoStart")
    }

    func onVideoPlay() {
        NSLog("Adtalos onVideoPlay")
    }

    func onVideoPause() {
        NSLog("Adtalos onVideoPause")
    }

    func onVideoEnd() {
        NSLog("Adtalos onVideoEnd")
    }

    func onVideoVolumeChange(_ volume: Double, muted: Bool) {
        NSLog("Adtalos onVideoVolumeChange: %f, %d", volume, muted)
    }

    func onVideoTimeUpdate(_ currentTime: Double, duration: Double) {
        NSLog("Adtalos onVideoTimeUpdate: %f, %f", currentTime, duration)
    }

    func onVideoError() {
        NSLog("Adtalos onVideoError")
    }

    func onVideoBreak() {
        NSLog("Adtalos onVideoBreak")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        interstitialAd = nil
        rewardedVideoAd = nil
    }
}
