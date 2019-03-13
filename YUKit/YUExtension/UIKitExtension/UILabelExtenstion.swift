//
//  UILabelExtenstion.swift
//  BeePowerPerson
//
//  Created by CLY on 2017/3/20.
//  Copyright © 2017年 ioschen. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// 宽度自适应
    open func autoWidth() {
        self.adjustsFontSizeToFitWidth = true
    }
    
    /// 高度自适应 这个方法需要改
    open func autoHeight() {
        //numberOfLines和sizeThatFits
        self.numberOfLines = 0
        //let size: CGSize = self.sizeThatFits(CGSize(width: self.width, height: CGFloat(MAXFLOAT)))
        self.frame = CGRect(self.x, self.y, self.width, self.height)
    }
    
    //label根据文字自适应高度
    open func autoHeightMax() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        let size: CGSize = self.sizeThatFits(CGSize(width: self.width, height: CGFloat(MAXFLOAT)))
        var newframe = self.frame
        newframe.size.height = size.height
        self.frame = newframe
    }
    
    /// 文本的宽高
    ///
    /// - Parameter size: constrainedToSize 如果一行，用CGSizeZero，否则用CGSizeMake(你想要的宽度, CGFloat(MAXFLOAT)
    open func size(size: CGSize = CGSize.zero) -> CGSize {
        let size: CGSize = (self.text?.textSizeWithFont(font: self.font, constrainedToSize: size))!
        return size
    }
    
    open func vipText(text: String,vipText: String,vipStart: Int,vipFont: CGFloat){
        let timeAttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: text)
        timeAttributedStrss.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: vipFont), range: NSMakeRange(vipStart, "\(vipText)".count)) //.characters.count
        self.attributedText = timeAttributedStrss
    }
    
    open func vipText(text: String,vipText: String,vipStart: Int,vipFont: UIFont,vipColor: UIColor){
        let timeAttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: text)
        timeAttributedStrss.addAttribute(NSAttributedStringKey.font, value: vipFont, range: NSMakeRange(vipStart, "\(vipText)".count))
        timeAttributedStrss.addAttribute(NSAttributedStringKey.foregroundColor, value: vipColor, range: NSMakeRange(vipStart, "\(vipText)".count))
        self.attributedText = timeAttributedStrss
    }
    
    open func vipText(text: String,ftext: String,fstart: Int,fontSize: CGFloat,ctext: String,cstart: Int,color: UIColor){
        let timeAttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: text)
        timeAttributedStrss.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fontSize), range: NSMakeRange(fstart, "\(ftext)".count))
        timeAttributedStrss.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: NSMakeRange(cstart, "\(ctext)".count))
//        timeAttributedStrss.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 20), range: NSMakeRange(cstart, "\(ctext)".characters.count))
        self.attributedText = timeAttributedStrss
    }
    
    /// 设置两种字体颜色
    ///
    /// - Parameters:
    ///   - text: 所有文本
    ///   - vipText: 设置不同颜色的字体
    ///   - color: 设置的颜色
    open func vipText(text: String,vipText: String,color: UIColor){
        let attributedStrs: NSMutableAttributedString = NSMutableAttributedString(string: text)
        let range = NSMakeRange(text.count-vipText.count, vipText.count)
        attributedStrs.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        self.attributedText = attributedStrs
    }
    
    open func vipText(text: String,vipText: String,font: UIFont){
        let attributedStrs = NSMutableAttributedString(string: text)
        let range = NSMakeRange(text.count-vipText.count, vipText.count)
        attributedStrs.addAttributes([NSAttributedStringKey.font: font], range: range)
        self.attributedText = attributedStrs
    }
    
    open func vipText(_ text: String,_ vipText: String,_ vipText2: String,font: UIFont,color: UIColor){
        let attributedStrs = NSMutableAttributedString(string: text)
        
        let range = NSMakeRange(text.count-vipText.count-vipText2.count, vipText.count)
        attributedStrs.addAttributes([NSAttributedStringKey.font: font], range: range)
        
        ///↑↑，↓↓，←→，←→
        if text.hasPrefix("↑") {
            let range0 = NSMakeRange(0, 1)
            let gcolor = UIColor(red:1.00, green:0.25, blue:0.25, alpha:1.00)
            attributedStrs.addAttributes([NSAttributedStringKey.foregroundColor: gcolor], range: range0)
        }else if text.hasPrefix("↓") {
            let range0 = NSMakeRange(0, 1)
            let gcolor = UIColor(red:0.09, green:0.56, blue:0.81, alpha:1.00)
            attributedStrs.addAttributes([NSAttributedStringKey.foregroundColor: gcolor], range: range0)
            attributedStrs.addAttributes([NSAttributedStringKey.font: font], range: range)
        }
        //其实没必要判断
        if vipText2 != "" {
            let range2 = NSMakeRange(text.count-vipText2.count, vipText2.count)
            attributedStrs.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range2)
        }
        self.attributedText = attributedStrs
    }
    
    /// 区分电话号码等 高亮显示
    open func distinguishPhoneNum() {
        //获取字符串中的电话号码
        let regulaStr: String = "\\d{3,4}[- ]?\\d{7,8}";
        let stringRange: NSRange = NSMakeRange(0, (self.text?.length)!)
        //正则匹配
        let str = NSMutableAttributedString(string: self.text!)
        let regexps = try! NSRegularExpression(pattern: regulaStr, options: NSRegularExpression.Options(rawValue: 0))
        
        regexps.enumerateMatches(in: self.text!, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: stringRange, using: { (result, flags, stop) in
            let phoneRange: NSRange = result!.range
            //定义一个NSAttributedstring接受电话号码字符串
            //let phoneNumber = str.attributedSubstring(from: phoneRange)
            //添加下划线
            let attribtDic = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle]
            str.addAttributes(attribtDic, range: phoneRange)
            
            //设置文本中的电话号码显示为黄色 NSForegroundColorAttributeName
            str.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.yellow, range: phoneRange)
            self.attributedText = str
            //self.isUserInteractionEnabled = true
            //添加手势，可以点击号码拨打电话addGestureRecognizer
        })
        
    }
    
}
