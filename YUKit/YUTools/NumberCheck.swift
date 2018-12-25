//
//  NumberCheck.swift
//  X
//
//  Created by chen on 2017/9/12.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

open class NumberCheck: NSObject {
    
    /// 手机号码验证
    ///
    /// - Parameter mobile: 手机号
    /// - Returns: 是否手机号
    public class func isValidateMobile(_ mobile: String) -> Bool {
         //手机号以13， 15，18开头，八个 \\d 数字字符
        //let phoneRegex = "^((13[0-9])|(15[^4,\\\\D])|(18[0,0-9]))\\\\d{8}$"
        let phoneRegex = "1[134578]([0-9]){9}"
        let phoneTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@" ,phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }
    
    public static func isBeeid(_ mobile: String) -> Bool {
        //手机号以813， 815，818开头，八个 \\d 数字字符
        //let phoneRegex = "^((13[0-9])|(15[^4,\\\\D])|(18[0,0-9]))\\\\d{8}$"
        let phoneRegex = "81[34578]([0-9]){9}"
        let phoneTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@" ,phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }
    
    /// 正则表达式验证手机号
    ///
    /// - Parameter num: 新加了号段电信199 移动198 联通166
    /// - Returns: 是否手机号
    public static func isTelNumber(_ num: NSString) -> Bool {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9]|9[8])\\d{8}$"
        let CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let CU = "^1(3[0-2]|5[256]|6[6]|8[56])\\d{8}$"
        let CT = "^1((33|53|8[09]9[9])[0-9]|349)\\d{7}$"
        //"^17[0-9]\\d{8}$
        //1349是中国卫星通信公司的全球星系统网号
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true)) {
            return true
        }else{
            return false
        }
    }
}
