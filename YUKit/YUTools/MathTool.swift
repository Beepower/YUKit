//
//  MathTool.swift
//  YUKit
//
//  Created by chen on 2018/8/23.
//  Copyright © 2018 chen. All rights reserved.
//

import Foundation

open class YUMath {
    /// 去除小数点后的无用零
    ///
    /// - Parameter testNumber: 数字
    /// - Returns: 去除无用零后
    open class func delPointZero(number: String) -> String{
        var outNumber = number
        var i = 1
        if number.contains(".") {
            while i < number.count {
                if outNumber.hasSuffix("0"){
                    outNumber = String(outNumber.dropLast())
                    i = i + 1
                }else{
                    break
                }
            }
            if outNumber.hasSuffix(".") {
                outNumber = String(outNumber.dropLast())
            }
            return outNumber
        } else{
            return number
        }
    }
    
    
    /// 保留小数
    ///
    /// - Parameter value: 数
    /// - Returns: 个位数保留2 十位数保留1 百位以上取整
    open class func showWS(value: Float)-> String {
        var ws = ""
        if value >= 100 {
            ws = "\(Int(value))"
        }else if value >= 10 {
            ws = String(format: "%.1f", value)
        }else {
            if value <= 0 {
                ws = "0"
            }else {
                ws = String(format: "%.2f", value)
            }
        }
        ws = YUMath.delPointZero(number: ws) //去除小数点后0
        return ws
    }
    
    /// 保留小数去除无用0
    ///
    /// - Parameter value: 数Float Int Double
    /// - Returns: 个位数保留2 十位数保留1 百位以上取整
    open class func wsDelZero<T>(_ value: T)-> String {
        var ws = ""
        if value is Int {
            let k = value as! Int
            ws = "\(k)"
        }else if value is Double{
            let k = value as! Double
            ws = "\(k)"
        }else if value is String{
            ws = "\(0)" //不允许传String
        }else {
            //Float
            let k = value as! Float
            ws = "\(k)"
        }
        let FValue = Float(ws)!
        if FValue >= 100.0 {
            ws = String(format: "%.1f", FValue) //"\(Int(FValue))" 越界
        }else if FValue >= 10.0 {
            ws = String(format: "%.1f", FValue)
        }else {
            if FValue <= 0.0 {
                ws = "0"
            }else {
                ws = String(format: "%.2f", FValue)
            }
        }
        ws = YUMath.delPointZero(number: ws) //去除小数点后0
        return ws
    }
    
    
    /// 百分比 已经弃用
    ///
    /// - Parameter number: 百分比
    /// - Returns: 百分比
    open class func numberAsPercentage(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = ""
        return formatter.string(from: NSNumber(value:number))!
    }
    
    /// 两个数据的百分比趋势↑10%
    ///
    /// - Parameters:
    ///   - a: 昨天或者前一个数据 非负数
    ///   - b: 今天或者后一个数据
    /// - Returns: ↑10% 上升下降多少
    open class func perCent(_ a: Float,_ b: Float) -> String {
        var ydp: Float = 0.0
        //如果分母为0 就用100%
        if a == 0 { ydp = 100 }
        ydp = (abs(a-b))/a*100
        let jian = b > a ? "↑" : "↓"
        if ydp > 9999 { ydp = 9999 }
        let percValue = "\(jian)\(YUMath.wsDelZero(ydp))%"
        return percValue
    }
}
