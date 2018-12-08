//
//  YULaunchImageADView.swift
//  PowerCC
//
//  Created by chenliangyu on 2016/6/28.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit
//import SDWebImage

enum AdType: Int {
    case fullScreenAdType = 1//全屏的广告
    case logoAdType = 0 //带logo的广告
}

//import "UIImageView+WebCache.h"
typealias LBClick = (_ tag: NSInteger) -> ()

class YULaunchImageADView: UIView {
    
//    var aDImgView: UIImageView!
////    var window: UIWindow!
//    var adTime: NSInteger!//倒计时总时长,默认6秒
//    var skipBtn: UIButton!
//    var clickBlock: LBClick!
//
//    var countDownTimer: NSTimer!
//    var isClick: Int = 0
//    
//    var secondsCountDown: NSInteger = 0 //倒计时总时长
//
//
//    init(window: UIWindow,type: AdType,imgUrl: String){
//        //self.window = window;
////        _secondsCountDown = 0;
//        //[window makeKeyAndVisible];
//        //获取启动图片
//        let viewSize: CGSize = window.bounds.size;
//        //横屏请设置成 @"Landscape"
//        let viewOrientation = "Portrait"
//        
//        let launchImageName: String = ""//nil
//        
//        let imagesDict: NSArray = NSBundle.mainBundle().infoDictionary["UILaunchImages"]
////            [[[NSBundle mainBundle] infoDictionary] valueForKey:@""];
//        for dict in imagesDict {
//            let imageSize: CGSize = CGSizeFromString(dict["UILaunchImageSize"])
//            if CGSizeEqualToSize(
//            if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]){
//                launchImageName = dict["UILaunchImageName"]
//            }
//        }
//        
//        let launchImage = UIImage(named: launchImageName)
//        self.backgroundColor = UIColor(patternImage: launchImage!)
//        self.frame = CGRectMake(0, 0, BWIDTH, BHEIGHT)
//        if type == AdType.FullScreenAdType {
//            self.aDImgView = UIImageView(frame: CGRectMake(0, 0, BWIDTH, BHEIGHT))
//        }else{
//            self.aDImgView = UIImageView(frame: CGRectMake(0, 0, BWIDTH, BHEIGHT-BWIDTH/3))
//        }
//        
//        self.skipBtn = UIButton(type: .Custom)
//        self.skipBtn.frame = CGRectMake(BWIDTH-70, 20, 60, 30);
//        self.skipBtn.backgroundColor = UIColor.brownColor()
//        self.skipBtn.titleLabel!.font = UIFont.systemFontOfSize(14)
//        self.skipBtn.addTarget(self, action: #selector(self.skipBtnClick), forControlEvents: .TouchUpInside)
//        self.aDImgView.addSubview(self.skipBtn)
//        
//        let maskPath: UIBezierPath = UIBezierPath(roundedRect: self.skipBtn.bounds, byRoundingCorners: UIRectCornerBottomRight | UIRectCornerTopRight, cornerRadii: CGSizeMake(15, 15))
//        let maskLayer: CAShapeLayer = CAShapeLayer()
//        maskLayer.frame = self.skipBtn.bounds
//        maskLayer.path = maskPath.CGPath
//        self.skipBtn.layer.mask = maskLayer
//        
//        let manager: SDWebImageManager = SDWebImageManager.sharedManager()
//        // options 0
//        manager.downloadImageWithURL(NSURL(string: imgUrl), options: SDWebImageOptions.AllowInvalidSSLCertificates, progress: { (receivedSize, expectedSize) in
//            //
//        }) { (image: UIImage, error, cacheType, finished, okimageURL) in
//            if image {
//                self.aDImgView.image = self.imageCompressForWidth(image, defineWidth: BWIDTH)
//            }
//        }
//        
//        self.aDImgView.tag = 1101
//        self.aDImgView.backgroundColor = UIColor.redColor()
//        self.addSubview(self.aDImgView)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.activiTap(_:)))
//        // 允许用户交互
//        self.aDImgView.userInteractionEnabled = true
//        self.aDImgView.addGestureRecognizer(tap)
//        
//        let opacityAnimation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityAnimation.duration = 0.8
//        opacityAnimation.fromValue = NSNumber(float: 0.0)
//        opacityAnimation.toValue = NSNumber(float: 0.8)
//        
//        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//        self.aDImgView.layer.addAnimation(opacityAnimation, forKey: "animateOpacity")
//        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
//        self.window?.addSubview(self)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //点击广告
//    func activiTap(recognizer: UITapGestureRecognizer){
//        self.isClick = 1
//        self.startcloseAnimation()
//    }
//    
//    //开启关闭动画
//    func startcloseAnimation(){
//        let opacityAnimation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityAnimation.duration = 0.5
//        opacityAnimation.fromValue = NSNumber(float: 1.0)
//        opacityAnimation.toValue = NSNumber(float: 0.3)
//        opacityAnimation.removedOnCompletion = false
//        opacityAnimation.fillMode = kCAFillModeForwards
//        
//        self.aDImgView.layer.addAnimation(opacityAnimation, forKey: "animateOpacity")
//        NSTimer.scheduledTimerWithTimeInterval(opacityAnimation.duration, target: self, selector: #selector(self.closeAddImgAnimation), userInfo: nil, repeats: false)
//    }
//    
//    func skipBtnClick(){
//        self.isClick = 2
//        self.startcloseAnimation()
//    }
//    
//    //关闭动画完成时处理事件
//    func closeAddImgAnimation() {
//        countDownTimer.invalidate()
//        countDownTimer = nil
//        self.hidden = true
//        self.aDImgView.hidden = true
//        self.hidden = true
//        if isClick == 1 {
//            //点击广告
//            if (self.clickBlock != nil) {
//                self.clickBlock(tag: 1100)
//            }
//        }else if isClick == 2 {
//            //点击跳过
//            if (self.clickBlock != nil) {
//                self.clickBlock(tag: 1101)
//                
//            }
//        }else{
//            //点击跳过
//            if ((self.clickBlock) != nil) {
//                self.clickBlock(tag: 1102);
//            }
//        }
//    }
//    
//    func onTimer() {
//        if adTime == 0 {
//            adTime = 6
//        }
//        if secondsCountDown < adTime {
//            secondsCountDown += 1
//            self.skipBtn.setTitle("\(secondsCountDown) | 跳过", forState: .Normal)
//        }else {
//            countDownTimer.invalidate()
//            countDownTimer = nil
//            self.startcloseAnimation()
//        }
//    }
//    
//    //指定宽度按比例缩放
//    func imageCompressForWidth(sourceImage: UIImage,defineWidth: CGFloat) -> UIImage{
//        var newImage: UIImage = UIImage()//nil
//        let imageSize: CGSize = sourceImage.size
//        let width: CGFloat = imageSize.width
//        let height: CGFloat = imageSize.height
//        let targetWidth: CGFloat = defineWidth
//        let targetHeight: CGFloat = height / (width / targetWidth)
//        let size: CGSize = CGSizeMake(targetWidth, targetHeight)
//        var scaleFactor: CGFloat = 0.0
//        var scaledWidth: CGFloat = targetWidth
//        var scaledHeight: CGFloat = targetHeight
//        var thumbnailPoint: CGPoint = CGPointMake(0.0, 0.0)
//    
//        if(CGSizeEqualToSize(imageSize, size) == false){
//    
//            let widthFactor: CGFloat = targetWidth / width
//            let heightFactor: CGFloat = targetHeight / height
//    
//            if(widthFactor > heightFactor){
//                scaleFactor = widthFactor
//            }else{
//                scaleFactor = heightFactor
//            }
//            scaledWidth = width * scaleFactor
//            scaledHeight = height * scaleFactor
//    
//            if(widthFactor > heightFactor){
//    
//                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
//    
//            }else if(widthFactor < heightFactor){
//    
//                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
//            }
//        }
//    
//        //UIGraphicsBeginImageContext(size);
//        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
//        var thumbnailRect: CGRect = CGRectZero
//        thumbnailRect.origin = thumbnailPoint
//        thumbnailRect.size.width = scaledWidth
//        thumbnailRect.size.height = scaledHeight
//    
//        sourceImage.drawInRect(thumbnailRect)
//    
//        newImage = UIGraphicsGetImageFromCurrentImageContext()
//    
////        if newImage == nil {
////            print("scale image fail")
////        }
//        
//        UIGraphicsEndImageContext()
//        return newImage
//    }
}
