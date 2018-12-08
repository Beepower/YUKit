//
//  YUVideoTool.swift
//  X
//
//  Created by chen on 2017/6/29.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit
import AVFoundation
//import MobileCoreServices
class YUVideoTool: NSObject {

    func localPicture(_ videoURL: URL) -> UIImage {
        let avAsset = AVAsset(url: videoURL)
        let generator = AVAssetImageGenerator(asset: avAsset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0.0,600)
        var actualTime:CMTime = CMTimeMake(0,0)
        let imageRef: CGImage = try! generator.copyCGImage(at: time, actualTime: &actualTime)
        let frameImg = UIImage(cgImage: imageRef)
        return frameImg //截图
    }
    
    
//    //获取本地视频
//    let filePath = NSBundle.mainBundle().pathForResource("hangge", ofType: "m4v")
//    let videoURL = NSURL(fileURLWithPath: filePath!)
//    self.localPicture(videoURL)
    
    
    //获取网络视频截图
    //由于网络请求比较耗时，所以异步线程获取在线视频
//    func netPicture(_ videoURL: URL) -> UIImage {
//        //异步获取网络视频
//        DispatchQueue.global().async {
//            let avAsset = AVURLAsset(url: videoURL)
//            //生成视频截图
//            let generator = AVAssetImageGenerator(asset: avAsset)
//            generator.appliesPreferredTrackTransform = true
//            let time = CMTimeMakeWithSeconds(0.0,600)
//            var actualTime: CMTime = CMTimeMake(0,0)
//            let imageRef: CGImage = try! generator.copyCGImage(at: time, actualTime: &actualTime)
//            let frameImg = UIImage(cgImage: imageRef)
//            //在主线程中显示截图
////            DispatchQueue.main.async {
//                return frameImg
////            }
//        }
//    }
    
    //获取网络视频
    //let url = "http://www.hangge.com/hangge.mp4"
    //let videoURL = NSURL(string: url)!
}
