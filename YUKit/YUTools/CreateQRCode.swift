//
//
//  Created by 中良 on 2016/8/26.
//  Copyright © 2016年 ioschen. All rights reserved.
//
//                          _oo0oo_
//                         088888880
//                         88" . "88
//                         (| -_- |)
//                          0\ = /0
//                       ___/'---'\___
//                     .' \\|     |// '.
//                    / \\|||  :  |||// \
//                   /_ ||||| -:- |||||- \
//                  |   | \\\  -  /// |   |
//                  | \_|  ''\---/''  |_/ |
//                  \  .-\__  '-'  __/-.  /
//                ___'. .'  /--.--\  '. .'___
//             ."" '<  '.___\_<|>_/___.' >'  "".
//            | | : '-  \'.;'\ _ /';.'/ - ' : | |
//            \  \ '_.   \_ __\ /__ _/   .-' /  /
//        ====='-.____'.___ \_____/___.-'____.-'=====
//                          '=---='
//
//            微信号: ioschen
//            博客地址: http://ioschen.com
//
//  CreateQRCode.swift
//  BeePowerPerson
//

import UIKit

open class CreateQRCode: NSObject {

    //MARK: -传进去字符串,生成二维码
    public static func image(_ text: String) -> UIImage{
        //创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        //还原滤镜的默认属性
        filter?.setDefaults()
        //设置需要生成二维码的数据
        filter?.setValue(text.data(using: String.Encoding.utf8), forKey: "inputMessage")
        //从滤镜中取出生成的图片
        let ciImage = filter?.outputImage
        //这个清晰度不好
        //let bgImage = UIImage(CIImage: ciImage!)
        //这个清晰度好
        let bgImage = createNonInterpolatedUIImageFormCIImage(ciImage!, size: 300)
        return bgImage
    }
    
    //MARK: -传进去字符串,生成二维码和头像图片
    public static func creatQRCodeImage(_ text: String,icon: UIImage) -> UIImage{
        //创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        //还原滤镜的默认属性
        filter?.setDefaults()
        //设置需要生成二维码的数据
        filter?.setValue(text.data(using: String.Encoding.utf8), forKey: "inputMessage")
        //从滤镜中取出生成的图片
        let ciImage = filter?.outputImage
        //这个清晰度不好
        //let bgImage = UIImage(CIImage: ciImage!)
        //这个清晰度好
        let bgImage = createNonInterpolatedUIImageFormCIImage(ciImage!, size: 300)
        //合成图片(把二维码和头像合并)
        let newImage = creatImage(bgImage, iconImage: icon)
        //返回生成好的二维码
        return newImage
    }
    
    //MARK: - 根据背景图片和头像合成头像二维码
    public static func creatImage(_ bgImage: UIImage, iconImage:UIImage) -> UIImage{
        
        //开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        //绘制背景图片
        bgImage.draw(in: CGRect(origin: CGPoint.zero, size: bgImage.size))
        //绘制头像
        let width: CGFloat = 50
        let height: CGFloat = width
        let x = (bgImage.size.width - width) * 0.5
        let y = (bgImage.size.height - height) * 0.5
        iconImage.draw(in: CGRect(x: x, y: y, width: width, height: height))
        //取出绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回合成好的图片
        return newImage!
    }
    
    //MARK: - 根据CIImage生成指定大小的高清UIImage
    public static func createNonInterpolatedUIImageFormCIImage(_ image: CIImage, size: CGFloat) -> UIImage {
        
        let extent: CGRect = image.extent.integral
        let scale: CGFloat = min(size/extent.width, size/extent.height)
        
        let width = extent.width * scale
        let height = extent.height * scale
        let cs: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImage = context.createCGImage(image, from: extent)!
        
        bitmapRef.interpolationQuality = CGInterpolationQuality.none
        bitmapRef.scaleBy(x: scale, y: scale);
        bitmapRef.draw(bitmapImage, in: extent);
        let scaledImage: CGImage = bitmapRef.makeImage()!
        return UIImage(cgImage: scaledImage)
    }
    
//    func createQRForString(qrString: String?, qrImageName: String?) -> UIImage?{
//        if let sureQRString = qrString{
//            let stringData = sureQRString.data(using: String.Encoding.utf8, allowLossyConversion: false)
//            //创建一个二维码的滤镜
//            let qrFilter = CIFilter(name: "CIQRCodeGenerator")
//            qrFilter?.setValue(stringData, forKey: "inputMessage")
//            qrFilter?.setValue("H", forKey: "inputCorrectionLevel")
//            let qrCIImage = qrFilter?.outputImage
//            
//            // 创建一个颜色滤镜,黑白色
//            let colorFilter = CIFilter(name: "CIFalseColor")!
//            colorFilter.setDefaults()
//            colorFilter.setValue(qrCIImage, forKey: "inputImage")
//            colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
//            colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
//            // 返回二维码image
//            let codeImage = UIImage(ciImage: (colorFilter.outputImage!.applying(CGAffineTransform(scaleX: 5, y: 5))))
//            
//            // 中间一般放logo
//            if let iconImage = UIImage(named: qrImageName!) {
//                let rect = CGRect(x: 0, y: 0, width: codeImage.size.width, height: codeImage.size.height)
//                
//                UIGraphicsBeginImageContext(rect.size)
//                codeImage.draw(in: rect)
//                let avatarSize = CGSize(width: rect.size.width*0.25, height: rect.size.height*0.25)
//                
//                let x = (rect.width - avatarSize.width) * 0.5
//                let y = (rect.height - avatarSize.height) * 0.5
//                iconImage.draw(in: CGRect(x: x, y: y, width: avatarSize.width, height: avatarSize.height))
//                
//                let resultImage = UIGraphicsGetImageFromCurrentImageContext()
//                
//                UIGraphicsEndImageContext()
//                return resultImage
//            }
//            return codeImage
//        }
//        return nil
//    }
    
}
