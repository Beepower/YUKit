//
//  IntExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 2016/7/4.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation


extension Int {
    /**
     获取数字的第N为数，如个位数值
     - parameter digitIndex: 第几位
     - returns: 值
     */
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
    
    /**
     这个数字的位数
     - returns: 返回位数
     */
    func WeiShu() -> Int {
        //if calls != nil && calls > 0
        if self == 0 {
            return 0
        }else {
            //import Cocoa使用Cocoa.sqrt()也可以
            let weishu: Double = log10(Double(self))
            return Int(weishu)+1
        }
    }
}

// 接著就可以得到每一個位數的數字
// 得到個位數：9
//123456789[0]

// 得到千位數：6
//123456789[3]


extension Double {
    public func format(_ f: String) -> Double {
        let ss = NSString(format: "%\(f)f" as NSString, self)
        return ss.doubleValue
    }
    public func format(_ f: Int) -> Double {
        let ss = NSString(format: "%.\(f)f" as NSString, self)
        return ss.doubleValue
    }
}
extension Float {
    public func format(_ f: String) -> Float {
        let ss = NSString(format: "%\(f)f" as NSString, self)
        return ss.floatValue
    }
    public func format(_ f: Int) -> Float {
        let ss = NSString(format: "%.\(f)f" as NSString, self)
        return ss.floatValue
    }
}
