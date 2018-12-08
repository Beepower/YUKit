//
//  ColorString.swift
//  PowerCC
//
//  Created by chenliangyu on 16/2/1.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit

class ColorString: NSObject {

    class func ColorString(_ name: String,fsize: CGFloat,frange: NSRange,color: UIColor,crange: NSRange) -> NSMutableAttributedString {
        let AttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: name)
        AttributedStrss.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fsize), range: frange)
        AttributedStrss.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: crange)
        return AttributedStrss
    }
    
    class func lastString(_ name: String,fsize: CGFloat,color: UIColor) -> NSMutableAttributedString {
        let AttributedStrss: NSMutableAttributedString = NSMutableAttributedString(string: name)
        let range: NSRange = NSMakeRange(name.count-1, 1)
        AttributedStrss.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fsize), range: range)
        AttributedStrss.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
        return AttributedStrss
    }
    
}
