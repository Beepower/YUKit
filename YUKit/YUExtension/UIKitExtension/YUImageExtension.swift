//
//  YUImageExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 16/5/10.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 图片转data(png jpeg)
    ///
    /// - Parameter compressionQuality: 压缩比例0-1
    /// - Returns: 返回data
    public func toData(_ compressionQuality: CGFloat = 0.75) -> Data {
        return self.jpegData(compressionQuality: compressionQuality)!
        //return UIImageJPEGRepresentation(self, compressionQuality)!
    }
    
    public static func createImage(color: UIColor, size: CGSize) -> UIImage? {
        
        var rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
    
//    /// 图片转data(png jpeg)
//    ///
//    /// - Returns: 返回data
//    func toData() -> Data {
//        let data: Data!
//        if ((UIImagePNGRepresentation(self)) != nil) {
//            data = UIImagePNGRepresentation(self)
//        }else {
//            data = UIImageJPEGRepresentation(self, 1.0)
//        }
//        return data
//    }
    
    /**
     获取图片中的像素颜色值
     - parameter pos: 图片中的位置
     - returns: 颜色值
     */
    public func getPixelColor(pos:CGPoint)->(alpha: CGFloat, red: CGFloat, green: CGFloat,blue:CGFloat){
        let pixelData = self.cgImage!.dataProvider!.data
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return (a,r,g,b)
    }
    
    public func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData = self.cgImage!.dataProvider!.data
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    
//    static void RGBtoHSV( float r, float g, float b, float *h, float *s, float *v )
//    {
//    float min, max, delta;
//    min = MIN( r, MIN( g, b ));
//    max = MAX( r, MAX( g, b ));
//    *v = max;               // v
//    delta = max - min;
//    if( max != 0 )
//    *s = delta / max;       // s
//    else {
//    // r = g = b = 0        // s = 0, v is undefined
//    *s = 0;
//    *h = -1;
//    return;
//    }
//    if( r == max )
//    *h = ( g - b ) / delta;     // between yellow & magenta
//    else if( g == max )
//    *h = 2 + ( b - r ) / delta; // between cyan & yellow
//    else
//    *h = 4 + ( r - g ) / delta; // between magenta & cyan
//    *h *= 60;               // degrees
//    if( *h < 0 )
//    *h += 360;
//    }
    
//    func mostColor() -> UIColor{
//        let bitmapInfo: Int = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast
//        //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
//        let thumbSize: CGSize = CGSize(width: 40, height: 40)
//        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
//        let context: CGContextRef = CGBitmapContextCreate(NULL,
//                                                     thumbSize.width,
//                                                     thumbSize.height,
//                                                     8,//bits per component
//            thumbSize.width*4,
//            colorSpace,
//            bitmapInfo);
//    
//        let drawRect: CGRect = CGRect(x: 0, y: 0, width: thumbSize.width, height: thumbSize.height)
//        CGContextDrawImage(context, drawRect, image.CGImage)
//        CGColorSpaceRelease(colorSpace)
//    
//        //第二步 取每个点的像素值
//        unsigned char* data = CGBitmapContextGetData (context)
//    
//        if (data == NULL) return nil
//        NSArray *MaxColor = nil
//        // NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
//        float maxScore=0
//        for (int x=0; x<thumbSize.width*thumbSize.height; x++) {
//            int offset = 4*x
//            int red = data[offset]
//            int green = data[offset+1]
//            int blue = data[offset+2]
//            int alpha =  data[offset+3]
//            
//            if (alpha<25)continue;
//            float h,s,v;
//            RGBtoHSV(red, green, blue, &h, &s, &v);
//    
//            float y = MIN(abs(red*2104+green*4130+blue*802+4096+131072)>>13, 235);
//            y= (y-16)/(235-16);
//            if (y>0.9) continue;
//    
//            float score = (s+0.1)*x;
//            if (score>maxScore) {
//                maxScore = score;
//            }
//            MaxColor=@[@(red),@(green),@(blue),@(alpha)];
//            //[cls addObject:clr];
//        }
//        CGContextRelease(context);
//    
//        return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
//    }
    
    public func scaleTo(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public func tint(_ color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        //let context = UIGraphicsGetCurrentContext()
        //CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
    /**
     
     
     - parameter color:
     
     - returns:
     */
    
    
    /// 图片染色 纯色图片
    ///
    /// - Parameter color: 填充色
    /// - Returns: 返回一个图片背景色为参数
    public func dyeing(_ color: UIColor) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.normal)
        let rect: CGRect = CGRect(0, 0, self.size.width, self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
//        let rect: CGRect = CGRect(x: 0,y: 0,width: 1,height: 1)
//        UIGraphicsBeginImageContext(rect.size)
//        let content: CGContext = UIGraphicsGetCurrentContext()!
//        content.setFillColor(color.cgColor)
//        //        CGContentSetColorWithColor(context,color.CGColor)
//        content.fill(rect)
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
    }
    
    
    
    
    
    
    /**
     修改图片颜色
     
     - parameter color: 修改的颜色
     
     - returns: 修改颜色后的图
     */
//    func imageWithColor(color: UIColor) -> UIImage{
//        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
//        CGContextRefcontext = UIGraphicsGetCurrentContext();
//        CGContextTranslateCTM(context, 0, self.size.height);
//        CGContextScaleCTM(context, 1.0, -1.0);
//        CGContextSetBlendMode(context, .Normal);
//        let rect: CGRect = CGRectMake(0, 0, self.size.width, self.size.height);
//        CGContextClipToMask(context, rect, self.CGImage);
//        color.setFill()
//        CGContextFillRect(context, rect);
//        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        return newImage
//    }
}
