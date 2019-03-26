//
//  YUImageTool.swift
//  X
//
//  Created by chen on 2017/6/30.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

open class YUImageTool: NSObject {

    public static func groupHead(imgs: [UIImage],pngname: String) -> String {
        YUPrint("我的头像数量\(imgs.count)")
        let headWidth: CGFloat = 50
        //大小为画布创建上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: headWidth, height: headWidth), false, UIScreen.main.scale)//最后一个参数2.0
        //UIGraphicsBeginImageContext(CGSize(width: headWidth, height: headWidth))//根据当前大小创建一个基于位图图形的环境
        #imageLiteral(resourceName: "group_head_bg").draw(in: CGRect(0, 0, headWidth, headWidth))
        
        //群最少三个人 最多显示9个头像
        //3 //4
        //5 //6
        //7 //8 //9
        let jj: CGFloat = 2 //间距
        var w = headWidth/2
        if imgs.count > 4 {
            w = (headWidth-jj*4)/3
            if imgs.count == 5 {
                imgs[0].draw(in: CGRect((w+jj)/2+jj, (w+jj)/2+jj, w, w))
                imgs[1].draw(in: CGRect((w+jj)/2+w+2*jj, (w+jj)/2+jj, w, w))
                imgs[2].draw(in: CGRect(0+jj, (w+jj)/2+w+2*jj, w, w))
                imgs[3].draw(in: CGRect(w+2*jj, (w+jj)/2+w+2*jj, w, w))
                imgs[4].draw(in: CGRect(w*2+3*jj, (w+jj)/2+w+2*jj, w, w))
            }else if imgs.count == 6 {
                imgs[0].draw(in: CGRect(0+jj, (w+jj)/2+jj, w, w))
                imgs[1].draw(in: CGRect(w+2*jj, (w+jj)/2+jj, w, w))
                imgs[2].draw(in: CGRect(w*2+3*jj, (w+jj)/2+jj, w, w))
                imgs[3].draw(in: CGRect(0+jj, (w+jj)/2+w+2*jj, w, w))
                imgs[4].draw(in: CGRect(w+2*jj, (w+jj)/2+w+2*jj, w, w))
                imgs[5].draw(in: CGRect(w*2+3*jj, (w+jj)/2+w+2*jj, w, w))
            }else if imgs.count == 7 {
                imgs[0].draw(in: CGRect(w+2*jj, 0+jj, w, w))
                imgs[1].draw(in: CGRect(0+jj, w+2*jj, w, w))
                imgs[2].draw(in: CGRect(w+2*jj, w+2*jj, w, w))
                imgs[3].draw(in: CGRect(w*2+3*jj, w+2*jj, w, w))
                imgs[4].draw(in: CGRect(0+jj, w*2+3*jj, w, w))
                imgs[5].draw(in: CGRect(w+2*jj, w*2+3*jj, w, w))
                imgs[6].draw(in: CGRect(w*2+3*jj, w*2+3*jj, w, w))
            }else if imgs.count == 8 {
                imgs[0].draw(in: CGRect((w+jj)/2+jj, 0+jj, w, w))
                imgs[1].draw(in: CGRect((w+jj)/2+w+2*jj, 0+jj, w, w))
                imgs[2].draw(in: CGRect(0+jj, w+2*jj, w, w))
                imgs[3].draw(in: CGRect(w+2*jj, w+2*jj, w, w))
                imgs[4].draw(in: CGRect(w*2+3*jj, w+2*jj, w, w))
                imgs[5].draw(in: CGRect(0+jj, w*2+3*jj, w, w))
                imgs[6].draw(in: CGRect(w+2*jj, w*2+3*jj, w, w))
                imgs[7].draw(in: CGRect(w*2+3*jj, w*2+3*jj, w, w))
            }else{
                imgs[0].draw(in: CGRect(0+jj, 0+jj, w, w))
                imgs[1].draw(in: CGRect(w+2*jj, 0+jj, w, w))
                imgs[2].draw(in: CGRect(w*2+3*jj, 0+jj, w, w))
                imgs[3].draw(in: CGRect(0+jj, w+2*jj, w, w))
                imgs[4].draw(in: CGRect(w+2*jj, w+2*jj, w, w))
                imgs[5].draw(in: CGRect(w*2+3*jj, w+2*jj, w, w))
                imgs[6].draw(in: CGRect(0+jj, w*2+3*jj, w, w))
                imgs[7].draw(in: CGRect(w+2*jj, w*2+3*jj, w, w))
                imgs[8].draw(in: CGRect(w*2+3*jj, w*2+3*jj, w, w))
            }
        }else {
            w = (headWidth-jj*3)/2
            if imgs.count == 1 {
                //这种情况不可能出现排除
                imgs[0].draw(in: CGRect(0+jj, (headWidth-w)/2, w, w))
//                imgs[1].draw(in: CGRect(w+2*jj, (headWidth-w)/2, w, w))
            }else if imgs.count == 2 {
                imgs[0].draw(in: CGRect(0+jj, (headWidth-w)/2, w, w))
                imgs[1].draw(in: CGRect(w+2*jj, (headWidth-w)/2, w, w))
            }else{
                imgs[0].draw(in: CGRect(0+jj, w+2*jj, w, w))
                imgs[1].draw(in: CGRect(w+2*jj, w+2*jj, w, w))
                if imgs.count == 3 {
                    imgs[2].draw(in: CGRect((headWidth-w)/2, 0+jj, w, w))
                }else {
                    imgs[2].draw(in: CGRect(0+jj, 0+jj, w, w))
                    imgs[3].draw(in: CGRect(w+2*jj, 0+jj, w, w))
                }
            }
        }
        
        //从当前上下文中获得最终图片
        let resultImg: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()//关闭上下文
        
        //let pngTime = YUFile.pngTime()
        let pngurl = YUFile.getPath()+pngname+".png"
        try? resultImg.pngData()?.write(to: URL(fileURLWithPath: pngurl))
        //try! UIImagePNGRepresentation(resultImg)?.write(to: URL.init(fileURLWithPath: pngurl))
        return pngname+".png"//pngTime //resultImg
    }
    
    public static func composeImg(img: UIImage,img1: UIImage) -> UIImage {
        let imgRef: CGImage = img.cgImage!
        let w: CGFloat = CGFloat(imgRef.width)
        let h: CGFloat = CGFloat(imgRef.height)
        
        //以1.png的图大小为底图
        let imgRef1: CGImage = img1.cgImage!
        let w1: CGFloat = CGFloat(imgRef1.width)
        let h1: CGFloat = CGFloat(imgRef1.height)
        
        //以1.png的图大小为画布创建上下文
        UIGraphicsBeginImageContext(CGSize(width: w1, height: h1))
        //先把1.png 画到上下文中
        img1.draw(in: CGRect(x: 0, y: 0, width: w1, height: h1))
        //再把小图放在上下文中
        img.draw(in: CGRect(x: 100, y: 100, width: w, height: h))
        //从当前上下文中获得最终图片
        let resultImg: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()//关闭上下文
        
        //保存图片到沙盒
        //UIImagePNGRepresentation(resultImg)?.write(to: url)
        return resultImg
    }
    
    // 1.把多张绘制成一张图片
    public func drawImages(imageArray: [UIImage]) -> UIImage {
        // 1.1.图片的宽度
        var width: CGFloat = 0
        // 1.2.图片的高度
        var height: CGFloat = 0
        
        // 1.3.遍历图片数组里的所有图片
        for image in imageArray {
            // 1.3.1.获取每一张图片的宽度
            width = (image.size.width > width) ? image.size.width : width
            // 1.3.2.获取每一张图片的高度, 并且相加
            height += image.size.height
        }
        
        // 1.4.开始绘制图片的大小
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // 1.5.设置一个变量用来获取UIImage的Y值
        var imageY: CGFloat = 0
        // 1.6.遍历图片的数组
        for image in imageArray {
            // 1.6.1.开始绘画图片
            image.draw(at: CGPoint(x: 0, y: imageY))
            // 1.6.2.自增每张图片的Y轴
            imageY += image.size.height
        }
        
        // 1.7.获取已经绘制好的图片
        let drawImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 1.8.结束绘制图片
        UIGraphicsEndImageContext()
        
        // 1.9.返回已经绘制的图片
        return drawImage!
    }
    
    // 1.把两张图片绘制成一张图片
    public func combine(leftImage: UIImage, rightImage: UIImage) -> UIImage {
        
        // 1.1.获取第一张图片的宽度
        let width = leftImage.size.width
        // 1.2.获取第一张图片的高度
        let height = leftImage.size.height + rightImage.size.height
        
        // 1.3.开始绘制图片的大小
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        // 1.4.绘制第一张图片的起始点
        leftImage.draw(at: CGPoint(x: 0, y: 0))
        // 1.5.绘制第二章图片的起始点
        rightImage.draw(at: CGPoint(x: 0, y: leftImage.size.height + 5))
        
        // 1.6.获取已经绘制好的
        let imageLong = UIGraphicsGetImageFromCurrentImageContext()
        // 1.7.结束绘制
        UIGraphicsEndImageContext()
        
        // 1.8.返回已经绘制好的图片
        return imageLong!
    }
    
    
    /**
     截取部分UIImage
     
     - parameter orgImage: orgImage description
     - parameter clipRect: clipRect description
     
     - returns: return value description
     */
    //    func clipImageFromImage(orgImage: UIImage,clipRect: CGRect) -> UIImage {
    //        CGImageRef imageRef = orgImage.CGImage;
    //        CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, clipRect);
    //        CGSize size;
    //        size = clipRect.size;
    //        UIGraphicsBeginImageContext(size);
    //        CGContextRef context = UIGraphicsGetCurrentContext();
    //        CGContextDrawImage(context, clipRect, subImageRef);
    //        UIImage* clipImage = [UIImage imageWithCGImage:subImageRef];
    //        CGImageRelease(subImageRef);
    //        UIGraphicsEndImageContext();
    //        return clipImage;
    //    }
    /**
     图片合成 传一个数组
     */
    public class func addImage(_ image1: UIImage,image2: UIImage,image3: UIImage,image4: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(image1.size);
        image1.draw(in: CGRect(x: 0, y: 0, width: image1.size.width/2, height: image1.size.height/2))
        image2.draw(in: CGRect(x: image1.size.width/2, y: 0, width: image2.size.width/2, height: image2.size.height/2))
        image3.draw(in: CGRect(x: 0, y: image1.size.height/2, width: image1.size.width/2, height: image1.size.height/2))
        image4.draw(in: CGRect(x: image1.size.width/2, y: image1.size.height/2, width: image2.size.width/2, height: image2.size.height/2))
        let resultingImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return resultingImage;
    }
    //    3、画纯色UIImage
    //    CGSize imageSize = CGSizeMake(50, 50);
    //    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    //    [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] set];
    //    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    //    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    
}
