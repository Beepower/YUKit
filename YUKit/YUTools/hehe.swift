//
//  hehe.swift
//  PowerCC
//
//  Created by chenliangyu on 15/12/30.
//  Copyright © 2015年 Whale. All rights reserved.
//

import Foundation


open class Local {
    /// 是否简体中文zh-Hans-CN
    public class func isZH() -> Bool {
        let preferredLang = Bundle.main.preferredLocalizations.first! as NSString
        //        let preferredLang = (languages! as AnyObject).object(0)
        YUPrint("当前系统语言:\(preferredLang)")
        
        switch String(describing: preferredLang) {
        case "en-US", "en-CN":
            return false
        case "zh-Hans-US","zh-Hans-CN","zh-Hant-CN","zh-TW","zh-HK","zh-Hans":
            return true
        default:
            return false
        }
        
        //        let currentLanguage = Locale.preferredLanguages[0]
        //        if currentLanguage == "zh-Hans-CN" {
        //            return true
        //        }else{
        //            return false
        //        }
    }
    
    //    static func getCurrentLanguage() -> String {
    //        //        let defs = UserDefaults.standard
    //        //        let languages = defs.object(forKey: "AppleLanguages")
    //        //        let preferredLang = (languages! as AnyObject).object(0)
    //        let preferredLang = Bundle.main.preferredLocalizations.first! as NSString
    //        //        let preferredLang = (languages! as AnyObject).object(0)
    //        YUPrint("当前系统语言:\(preferredLang)")
    //
    //        switch String(describing: preferredLang) {
    //        case "en-US", "en-CN":
    //            return "en"//英文
    //        case "zh-Hans-US","zh-Hans-CN","zh-Hant-CN","zh-TW","zh-HK","zh-Hans":
    //            return "cn"//中文
    //        default:
    //            return "en"
    //        }
    //    }
    
    
}


//        refreshControl!.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
//        refreshControl!.attributedTitle = NSAttributedString(string: "松手刷新新闻")
//        self.tableView.addSubview(refreshControl!)
//        refreshData()

//    func refreshData() {
//        let bquery = BmobQuery(className: "News")
//        bquery.findObjectsInBackgroundWithBlock({array, error in
//            self.dataArray = array
//            self.newsTableView.reloadData()
//            self.refreshControl.endRefreshing()
//        })
//    }

open class hehe {
    
    //MARK:- Utilities
    public class func clientID() -> String {
        let userDefaults = UserDefaults.standard
        let clientIDPersistenceKey = "clientID"
        var clientID = ""
        if let savedClientID = userDefaults.object(forKey: clientIDPersistenceKey) as? String {
            clientID = savedClientID
        } else {
            clientID = self.randomStringWithLength(5)
            userDefaults.set(clientID, forKey: clientIDPersistenceKey)
            userDefaults.synchronize()
        }
        return "applePower/\(clientID)"
    }
    
    //http://stackoverflow.com/questions/26845307/generate-random-alphanumeric-string-in-swift
    
    public class func randomStringWithLength(_ len: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: len)
//        (var i=0; i < len; i += 1)
        for _ in 0 ..< len{
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        return String(randomString)
    }
}
