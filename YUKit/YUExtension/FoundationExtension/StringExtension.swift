//
//  StringExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 15/12/31.
//  Copyright © 2015年 Whale. All rights reserved.
//

import UIKit

extension NSString {
    public func sizeWithFont(font:UIFont,maxSize:CGSize) -> CGSize {
        return self.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context: nil).size
    }
}

extension String {
    /// 获取拼音首字母
    ///
    /// - Returns: 拼音首字母
    public func PYFirst() -> String {
        YUPrint(self)
        var py = "#"
        let str = CFStringCreateMutableCopy(nil, 0, self as CFString!)
        CFStringTransform(str, nil, kCFStringTransformToLatin, false)
        CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, false)
        py = (str as String?)!
        let index = py.index(py.startIndex, offsetBy: 1)
        py = String(py[py.startIndex..<index]) //py.substring(to: index).uppercased()
        return py
    }
    
    
    /// 获取拼音
    ///
    /// - Returns: 字符串
    public func PY() -> String {
        var py = "#"
        let str = CFStringCreateMutableCopy(nil, 0, self as CFString!)
        CFStringTransform(str, nil, kCFStringTransformToLatin, false)
        CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, false)
        py = (str as String?)!
        return py
    }
    
//    ///////拼音带多音字开始
//    // MARK: - 获取联系人姓名首字母(传入汉字字符串, 返回大写拼音首字母)
//    func getFirstLetterFromString(aString: String) -> (String) {
//
//        // 注意,这里一定要转换成可变字符串
//        let mutableString = NSMutableString.init(string: aString)
//        // 将中文转换成带声调的拼音
//        CFStringTransform(mutableString as CFMutableString, nil, kCFStringTransformToLatin, false)
//        // 去掉声调(用此方法大大提高遍历的速度)
//        let pinyinString = mutableString.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
//        // 将拼音首字母装换成大写
//        let strPinYin = polyphoneStringHandle(nameString: aString, pinyinString: pinyinString).uppercased()
//        // 截取大写首字母
//        let firstString = strPinYin.substring(to: strPinYin.index(strPinYin.startIndex, offsetBy:1))
//        // 判断姓名首位是否为大写字母
//        let regexA = "^[A-Z]$"
//        let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
//        return predA.evaluate(with: firstString) ? firstString : "#"
//    }
//
//
//    /// 多音字处理  待优化
//    func polyphoneStringHandle(nameString:String, pinyinString:String) -> String {
//        if nameString.hasPrefix("长") {return "chang"}
//        if nameString.hasPrefix("沈") {return "shen"}
//        if nameString.hasPrefix("厦") {return "xia"}
//        if nameString.hasPrefix("地") {return "di"}
//        if nameString.hasPrefix("重") {return "chong"}
//        return pinyinString
//    }
//    ///////拼音带多音字结束
    
    //func uppercaseString() -> String {
    //    return "uppercaseString"
    //}
    //
    //func getTheFirstLetterStrings(content: String) -> String {
    //
    //    if content.characters.count < 1 {
    //        return " "
    //    }else{
    //        let index = (content as NSString).character(at: 0)
    //        if( index > 0x4e00 && index < 0x9fff) {
    //            return self.pinYinZChines(content)
    //        }else{
    //            let index = content.startIndex.advancedBy(0)
    //            let firstString = content[index]
    //            let stringZ = String.init(firstString)
    //            return stringZ.uppercaseString
    //        }
    //    }
    //}
    
    //let kCFStringTransformStripCombiningMarks: CFString! //删除重音符号
    //let kCFStringTransformToLatin: CFString! //中文的拉丁字母
    //let kCFStringTransformFullwidthHalfwidth: CFString!//全角半宽
    //let kCFStringTransformLatinKatakana: CFString!//片假名拉丁字母
    //let kCFStringTransformLatinHiragana: CFString!//平假名拉丁字母
    //let kCFStringTransformHiraganaKatakana: CFString!//平假名片假名
    //let kCFStringTransformMandarinLatin: CFString!//普通话拉丁字母
    //let kCFStringTransformLatinHangul: CFString!//韩文的拉丁字母
    //let kCFStringTransformLatinArabic: CFString!//阿拉伯语拉丁字母
    //let kCFStringTransformLatinHebrew: CFString!//希伯来语拉丁字母
    //let kCFStringTransformLatinThai: CFString!//泰国拉丁字母
    //let kCFStringTransformLatinCyrillic: CFString!//西里尔拉丁字母
    //let kCFStringTransformLatinGreek: CFString!//希腊拉丁字母
    //let kCFStringTransformToXMLHex: CFString!//转换为XML十六进制字符
    //let kCFStringTransformToUnicodeName: CFString!//转换为Unicode的名称
    //@availability(iOS, introduced=2.0)
    //let kCFStringTransformStripDiacritics: CFString!//转换成不带音标的符号
    
    
    
    /**
     获取拼音首字母，支持取一句话中每字拼音首字母
     
     - parameter string:   字
     - parameter allFirst: 第几个首字母
     
     - returns: 拼音首字母
     */
    //func PYString(_ string: String?, _ allFirst: Bool = false) ->String {
    //    var py = "#"
    //    if let s = string {
    //        if s == "" {
    //            return py
    //        }
    //        let str = CFStringCreateMutableCopy(nil, 0, s as CFString!)
    //        CFStringTransform(str, nil, kCFStringTransformToLatin, false)
    //        CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, false)
    //        //CFStringTransform(str, nil, kCFStringTransformToLatin, Boolean(0))
    //        //CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, Boolean(0))
    //        py = ""
    //        if allFirst {
    //            for x in (str as! String).components(separatedBy: " ") {
    //                py += PYFirst(x)
    //            }
    //        } else{
    //            py = (str as! NSString).substringToIndex(1).uppercased()
    //        }
    //    }
    //    return py
    //}
    
    ////获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
    //func firstCharactor(aString: String) -> NSString {
    //    //转成了可变字符串
    //    var str: String = aString
    //    //先转换为带声调的拼音
    //    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //    //再转换为不带声调的拼音
    //    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //    //转化为大写拼音
    //    let pinYin: String = [str capitalizedString];
    //    //获取并返回首字母
    //    return [pinYin substringToIndex:1];
    //}
    
    //////暂停使用这个方法
    
    /// 截取一个范围
    ///
    /// - Parameter r: [0..<3]
//    public subscript(r: Range<Int>) -> String {
//        get {
//            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound);
//            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
//            return String(self[startIndex..<endIndex]) //self.substring(with: Range(startIndex..<endIndex))
//
////            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
////            let endIndex = self.characters.index(self.startIndex, offsetBy: r.upperBound)
////            return self[Range(startIndex..<endIndex)]
//        }
//        set {
//            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound);
//            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
//            self.replaceSubrange(Range(startIndex..<endIndex), with: newValue)
//        }
//    }
    
    
    /// 截取查找到的字到最后
    ///
    /// - Parameter key: 查找什么字
    /// - Returns: 返回包含查找的字
    public func subAllFrom(_ key: String) -> String{
        let rangIndex = self.range(of: key)
        let startIndex = rangIndex!.lowerBound
        let result = String(self[startIndex..<self.endIndex]) //self.substring(with: startIndex..<self.endIndex)
        return result
        //TODO: 以后扩展成可以不到最后
    }
    
//    var subString = string[string.startIndex...string.index(string.startIndex, offsetBy: 4)]
//    var subString2 = string[string.index(string.endIndex, offsetBy: -5)..<string.endIndex]
//    var subString3 = string.substring(with: string.startIndex..<string.index(string.startIndex, offsetBy: 5))
//    var subString4 = string.substring(with: string.startIndex..<string.index(string.index(after: string.startIndex), offsetBy: 4))
    
    
    /// 从头到这里
    ///
    /// - Parameter key: 查找的
    /// - Returns: 从头到查到的
    public func subAllTo(_ key: String) -> String{
        let rangIndex = self.range(of: key)
        let startIndex = rangIndex!.lowerBound
        let result = String(self[self.startIndex..<startIndex])
        //self.substring(with: self.startIndex..<startIndex)//swift3
        //let subStr = str.substring(from: index) swift3
        //let subStr = String(str[index...]) swift4
        return result
        //TODO: 以后扩展成可以不到最后
    }
    
    
    /// 宽度高度
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - size: constrainedToSize 如果一行，用CGSizeZero，否则用CGSizeMake(你想要的宽度, CGFloat(MAXFLOAT)
    /// - Returns: 宽度高度
    public func textSizeWithFont(font: UIFont, constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if size.equalTo(CGSize.zero) {
            let attributes = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
            textSize = self.size(withAttributes: attributes as? [NSAttributedStringKey : Any])
        } else {
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let attributes = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
            let stringRect = self.boundingRect(with: size, options: option, attributes: attributes as? [NSAttributedStringKey : Any], context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
    
//    //固定宽度，来计算自适应的高度
//    let size1:CGSize = textString.textSizeWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize(width:200, height:CGFloat(MAXFLOAT)))
//    print("固定宽度200时，文本的区域为：\(size1)")
//    print("固定宽度200时，文本的高度是：\(size1.height)")
//    
//    //不限制宽度，自适应文本之后，计算文本的长度
//    let size2:CGSize = textString.textSizeWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize.zero)
//    print("不限制宽度，文本的区域为：\(size2)")
//    print("不限制宽度，文本的长度是：\(size2.width)")
  
    /// 是否包含字符串
    ///
    /// - Parameter c: 字符串
    /// - Returns: 返回是否
    public func has(_ c: String) -> Bool {
        return self.components(separatedBy: c).count > 1
    }
}

// 扩展String
//截取字符串
extension String {
    /// 长度
    public var length:Int{
        get {
            return self.count//self.characters.count
        }
    }
    
    /// 转换成NSString
    public var OCString: NSString {
        get {
            return self as NSString
        }
    }
    
    ///字体CGSize
    public func sizeWithFont(font:UIFont,maxSize:CGSize) -> CGSize {
        return self.OCString.sizeWithFont(font: font, maxSize: maxSize)
    }
    
    public static func isNullOrEmpty(_ str: String?) -> Bool {
        if str == nil {
            return true
        }
        if str!.isEmpty {
            return true
        }
        return false
    }
    
    //获取字符串的宽度和高度
    public func getRectSize(text: NSString,font: UIFont,size: CGSize) -> CGRect {
        let attributes = [NSAttributedStringKey.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect
    }
    
    
    //将字符串转换成NSString
    public func getWidth(font: UIFont) -> CGFloat {
        //UIFont.systemFont(ofSize: 18)
        let messtr = self as NSString
        let width = messtr.size(withAttributes: [NSAttributedStringKey.font: font]).width
        return width
    }
    public func getHeight(font: UIFont) -> CGFloat {
        //UIFont.systemFont(ofSize: 18)
        let messtr = self as NSString
        let height = messtr.size(withAttributes: [NSAttributedStringKey.font: font]).height
        return height
    }
    
    //纯swift实现
    public func getWH(font: UIFont) -> CGRect {
        //UIFont.systemFont(ofSize: 18)
        let attributes = [NSAttributedStringKey.font: font] //设置字体大小
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        //这里有个参数1——width和参数2——heigh经测试应该是设置横向和纵向的最大计算宽度和高度，如有不妥希望指出，相互学习，谢谢。（即当宽度接近与320.0时，就会换行，通过改变高度来计算字符串长度）
        let rect: CGRect = self.boundingRect(with: CGSize.init(width: 320.0, height: 999.9), options: option, attributes: attributes, context: nil)//获取字符串的frame
        YUPrint("宽:\(rect.width),高:\(rect.height)")
        return rect
    }
    
    public func getHeigh(font: UIFont,width: CGFloat) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        label.text = self
        label.font = font
        label.numberOfLines = 0
        label.sizeToFit()
        return label.frame.size.height
    }
    
    
    
    /**
     
     
     - parameter fontSize:
     - parameter width:
     
     - returns:
     */
    
    /// 获取字符串的高度
    ///
    /// - Parameters:
    ///   - fontSize: 字体大小
    ///   - width: 限制一行显示的宽度
    ///   - breakMode: 文本根据单词换行还是单个字 
    /// - Returns: 返回文本在width宽度的条件下的总高度
    public func height(_ fontSize: CGFloat, width: CGFloat,breakMode: NSLineBreakMode = NSLineBreakMode.byCharWrapping) ->CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = breakMode
        
        let attributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: style.copy()];
        
        // 强转成NSString
        let text = self as NSString
        let rect = text.boundingRect(with: size,
                                             options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                             attributes: attributes,
                                             context: nil)
        
        return rect.size.height
    }
    
    /**
     把时间戳转换成“2014年12月12日 8:20:20”格式的日期字符串
     
     - parameter timeStamp: 时间戳
     
     - returns: 2014年12月12日 8:20:20”格式的日期字符串
     */
    public func dateStringFromTimeStamp(_ timeStamp: NSString) ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:MM:ss"
        
        let date = Date(timeIntervalSince1970: timeStamp.doubleValue)
        return formatter.string(from: date)
    }
    
    
    ///去除空格和回车
    public func trim()->String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
    
    /**
     设置彩色字体
     
     - parameter name:  name description
     - parameter fsize: fsize description
     - parameter color: color description
     
     - returns: return value description
     */
    public func lastColorString(_ name: String,fsize: CGFloat,color: UIColor) -> NSMutableAttributedString {
        let AttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: name)
        let range: NSRange = NSMakeRange(name.count-1, 1)//NSMakeRange(name.characters.count-1, 1)
        AttributedStrss.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fsize), range: range)
        AttributedStrss.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
        return AttributedStrss
    }
    //MARK: font
//    for fontfamilyname in UIFont.familyNames {
//    print("family:\(fontfamilyname)")
//    for fontName in UIFont.fontNames(forFamilyName: fontfamilyname){
//    print("\tfont:\(fontName)")
//    }
//    print("-------------")
//    }

    
}
