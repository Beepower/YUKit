//
//  CRegex.swift
//  PowerCC
//
//  Created by chenliangyu on 16/1/20.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation

/// 正则
struct MyRegex {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern,
            options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        if let matches = regex?.matches(in: input,
            options: [],
            range: NSMakeRange(0, (input as NSString).length)) {
                return matches.count > 0
        } else {
            return false
        }
    }
    
    
    
    //自定义 =~ 运算符，方便正则匹配
    //像Ruby和Perl这样的语言，都有专门的=~运算符来进行正则匹配。而在Swift中，我们可以通过操作符的重载来实现。
    /*infix operator =~ {
    associativity none
    precedence 130
    }
    
    func =~ (lhs: String, rhs: String) -> Bool {
    return MyRegex(rhs).match(lhs) //需要前面定义的MyRegex配合
    }
    //使用方式如下：
    if "admin@hangge.com" =~ "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"{
    print("邮箱地址格式正确")
    }else{
    print("邮箱地址格式有误")
    }
    */
    
}
