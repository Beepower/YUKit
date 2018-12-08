//
//  URLExtension.swift
//  X
//
//  Created by chen on 2017/8/16.
//  Copyright © 2017年 chen. All rights reserved.
//

import Foundation
import UIKit


extension URL {
    
    /// 提取主机地址
    ///
    /// - Returns: 返回[协议]+[://]+[域名]http://www.ioschen.com
    public func getDoMain() -> String {
        let hostUrl: String = self.scheme!+"://"+self.host!
        return hostUrl
    }
    
    /// 提取域名
    ///
    /// - Returns: 返回域名
    public func getHost() -> String {
        return self.host!
        
    }
    
    public func open() -> Bool {
        if UIApplication.shared.canOpenURL(self) {
            UIApplication.shared.openURL(self)
            return true
        }else {
            return false
        }
    }
}
