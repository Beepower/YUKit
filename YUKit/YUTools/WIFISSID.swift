//
//  WIFISSID.swift
//  PowerCC
//
//  Created by chenliangyu on 16/4/18.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

open class WifiSSID: NSObject {
    public class func getSSID() -> String {
//        var currentSSID = ""
//        let interfaces:CFArray! = CNCopySupportedInterfaces()
//        for i in 0..<CFArrayGetCount(interfaces){
//            let interfaceName: UnsafeRawPointer
//                =  CFArrayGetValueAtIndex(interfaces, i)
//            let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
//            let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString)
//            if unsafeInterfaceData != nil {
//                let interfaceData = unsafeInterfaceData! as Dictionary!
//                currentSSID = interfaceData["SSID"] as! String
//            } else {
//                currentSSID = ""
//            }
//        }
//        return currentSSID
        return "hehe"
    }
    
    
}
