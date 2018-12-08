//
//  YUUserDefaults.swift
//  X
//
//  Created by chen on 22/09/2017.
//  Copyright © 2017 陈良宇. All rights reserved.
//

import UIKit

class YUUserDefaults: NSObject {

}
//
//  UserDefaultsExtension.swift
//  testHome
//
//  Created by chen on 21/09/2017.
//  Copyright © 2017 chen. All rights reserved.
//

import Foundation

class YUDefault {
    /// 储存
    ///
    /// - Parameters:
    ///   - key: key
    ///   - value: value
    class func set(key: String, value: AnyObject?){
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        }else{
            UserDefaults.standard.set(value, forKey: key)
            // 同步
            UserDefaults.standard.synchronize()
        }
    }
    
    /// 通过对应的key移除储存
    ///
    /// - Parameter key: 对应key
    class func remove(key: String?){
        if key != nil {
            UserDefaults.standard.removeObject(forKey: key!)
            UserDefaults.standard.synchronize()
        }
    }
    
    /// 通过key找到储存的value
    ///
    /// - Parameter key: key
    /// - Returns: AnyObject
    class func get(key:String) -> AnyObject? {
        return UserDefaults.standard.value(forKey: key) as AnyObject
    }
}
