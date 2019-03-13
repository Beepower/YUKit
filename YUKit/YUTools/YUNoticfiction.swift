//
//
//  Created by 中良 on 16/5/29.
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
//  YUNoticfiction.swift
//  PowerCC
//

import UIKit

open class YUNoticfiction: NSObject {

    //MARK: - ADD
    public static func add(_ observer: Any,selector: Selector,name: String,object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name.init(name), object: object)
    }
    public static func add(_ observer: Any,selector: Selector,name: Notification.Name,object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    //MARK: - Remove
    public static func remove(_ observer: Any,name: String,object: Any? = nil) {
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name.init(name), object: object)
    }
    public static func remove(_ observer: Any,name: NSNotification.Name?,object: Any? = nil) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
    }
    public static func remove(_ observer: Any,name: Notification.Name) {
        NotificationCenter.default.removeObserver(observer, name: name, object: nil)
    }
    public static func remove(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    //MARK: - Post
    public static func post(_ name: String, _ object: Any, _ userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name.init(name), object: object, userInfo: userInfo)
    }
    public static func post(_ name: Notification.Name, _ object: Any, _ userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    public static func post(_ name: Notification.Name,_ userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: name, object: nil, userInfo: userInfo)
    }
    
    //MARK: - 本地通知
    public class func addNotifiction(_ alertString: String,timeDouble: Double) {
        let notification = UILocalNotification()
        //let fireDate = NSDate().dateByAddingTimeInterval(-15*60)//15分钟后
        notification.fireDate = Date(timeIntervalSinceNow: timeDouble)
        notification.timeZone = TimeZone.current
        //notification.applicationIconBadgeNumber-=1;
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.alertBody = alertString
        //设置userinfo 方便在之后需要撤销的时候使用
        let info = ["key": alertString]
        notification.userInfo = info
        UIApplication.shared.scheduleLocalNotification(notification)
        
        //notification.alertAction = @"打开";  //提示框按钮
        //notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
            
        //alertAction也是一串字符（NSString)alertAction的内容将作为提醒中动作按钮上的文字如果未设置的话，提醒信息中的动作按钮将显示为“View”相对文字形式。
        //alertLaunchImage是在用户点击提醒框中动作按钮（“View”）时，等待应用加载时显示的图片，这个将替代应用原本设置的加载图片。
        //hasAction是一个控制是否在提醒框中显示动作按钮的布尔值，默认值为YES。
    }
    
    class func delNotifictionDelete(_ keyString: String) {
        let array = UIApplication.shared.scheduledLocalNotifications
        for loc: UILocalNotification in array! {
            if loc.userInfo!["key"] as! String == keyString {
                UIApplication.shared.cancelLocalNotification(loc)
            }
        }
//        for (UILocalNotification * loc in array) {
//            if ([[loc.userInfo objectForKey:@"key"] isEqualToString:keyString]) {
//                [[UIApplication sharedApplication]cancelLocalNotification:loc];
//            }
//        }
    }
        //从推送中删除end
}
