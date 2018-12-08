//
//
//  Created by 中良 on 2016/7/6.
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
//  YUThreadTool.swift
//  PowerCC
//

import UIKit

class YUThreadTool: NSObject {

    class func test(_ queueName: String = "test",background: @escaping () -> (),main: @escaping () -> ()) {
        DispatchQueue(label: queueName, attributes: []).async {
            YUPrint("异")
            background()
            DispatchQueue.main.async(execute: {
                YUPrint("是否是主线程\(Thread.isMainThread)")
                main()
            })
        }
    }
    
    
    
//    let queue: NSOperationQueue = NSOperationQueue()
//    let operation: NSBlockOperation = NSBlockOperation {
//        
//    }
//    queue.addOperation(operation)
    
}
