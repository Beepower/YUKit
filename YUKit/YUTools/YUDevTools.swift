//
//
//  Created by 中良 on 16/5/9.
//  Copyright © 2016年 Whale. All rights reserved.
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
//            微信号:ioschen
//            博客地址:http://ioschen.com
//
//  YUDevTools.swift
//  PowerCC
//

import UIKit

/// 开发调试工具
open class YUDevTools: NSObject {

    /**
     打印方法运行时间
     
     - parameter f: 传入运行的方法
     */
    public func measure(_ f: ()->()) {
        let start = CACurrentMediaTime()
        f()
        let end = CACurrentMediaTime()
        YUPrint("测量时间：\(end - start)")
    }
}
