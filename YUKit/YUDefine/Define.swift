//
//  Define.swift
//  PowerCC
//
//  Created by chenliangyu on 15/12/21.
//  Copyright © 2015年 Whale. All rights reserved.
//

import UIKit

//class Define: NSObject {}
public let YUDefaults = UserDefaults.standard
public let UUID = UIDevice.current.identifierForVendor?.uuidString

//本地化是货币

/// 国际化
///
/// - Parameter keyComment: 国际化
/// - Returns: 国际化
public func GJH(_ keyComment: String) -> String {
    return NSLocalizedString(keyComment, comment: keyComment)
}

public func YUPrint(_ item: @autoclosure () -> Any) {
    #if DEBUG
        print(item())
    #endif
}

public func YUPrintTime(_ item: @autoclosure () -> Any) {
    #if DEBUG
        print("\(item()) \(Date())")
    #endif
}

public func anyobjectConvertDic(any:Any)->[String:Any]?{
    var dic:[String:Any] = [:]
    for childer in Mirror(reflecting: any).children {
        dic[childer.label!] = childer.value
    }
    return dic
}

public typealias AnyBlock = () -> ()
/// 回调
public typealias huiDiao = () -> ()
public typealias huiDiaoString = (String) -> ()

public typealias huiDiaoValue = (AnyObject) -> ()
public typealias blockClick = () -> ()
public typealias huiDiaoAny = (Any) -> ()
public typealias huiDiaoBoolString = (Bool,String?) -> ()
public typealias huiDiaoBool = (Bool) -> ()
public typealias funcBlock = (Int,Int) -> ()

//file: String = __FILE__,
//method: String = __FUNCTION__,
//line: Int = __LINE__)
public func printLog<T>(_ message: T,
    file: String = #file,
    method: String = #function,
    line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

// 屏幕宽度
public let kScreenH = UIScreen.main.bounds.height
// 屏幕高度
public let kScreenW = UIScreen.main.bounds.width
// tabBar高度
public let kTabBarH: CGFloat = 49.0

// MARK:- 颜色方法
public func normalRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

// MARK:- 常用按钮颜色
public let kBtnWhite = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 1.00)
public let kBtnDisabledWhite = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 0.30)
public let kBtnGreen = RGBA(r: 0.15, g: 0.67, b: 0.16, a: 1.00)
public let kBtnDisabledGreen = RGBA(r: 0.65, g: 0.87, b: 0.65, a: 1.00)
public let kBtnRed = RGBA(r: 0.89, g: 0.27, b: 0.27, a: 1.00)
// 分割线颜色
public let kSplitLineColor = RGBA(r: 0.78, g: 0.78, b: 0.80, a: 1.00)
// 常规背景颜色
public let kCommonBgColor = RGBA(r: 0.92, g: 0.92, b: 0.92, a: 1.00)
public let kSectionColor = RGBA(r: 0.94, g: 0.94, b: 0.96, a: 1.00)
// 导航栏背景颜色
public let kNavBarBgColor = normalRGBA(r: 20, g: 20, b: 20, a: 0.9)

// 表情键盘颜色大全
public let kChatBoxColor = normalRGBA(r: 244.0, g: 244.0, b: 246.0, a: 1.0)
public let kLineGrayColor = normalRGBA(r: 188.0, g: 188.0, b: 188.0, a: 0.6)


// MARK:- 自定义打印方法
public func LXFLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
        
    #endif
}


// MARK:- 通知常量
// 通讯录好友发生变化
public let kNoteContactUpdateFriends  = "noteContactUpdateFriends"
// 添加消息
public let kNoteChatMsgInsertMsg    = "noteChatMsgInsertMsg"
// 更新消息状态
public let kNoteChatMsgUpdateMsg = "noteChatMsgUpdateMsg"
// 重发消息状态
public let kNoteChatMsgResendMsg = "noteChatMsgResendMsg"
// 点击消息中的图片
public let kNoteChatMsgTapImg = "noteChatMsgTapImg"
// 音频播放完毕
public let kNoteChatMsgAudioPlayEnd = "noteChatMsgAudioPlayEnd"
// 视频开始播放
public let kNoteChatMsgVideoPlayStart = "noteChatMsgVideoPlayStart"
/* ============================== 录音按钮长按事件 ============================== */
public let kNoteChatBarRecordBtnLongTapBegan = "noteChatBarRecordBtnLongTapBegan"
public let kNoteChatBarRecordBtnLongTapChanged = "noteChatBarRecordBtnLongTapChanged"
public let kNoteChatBarRecordBtnLongTapEnded = "noteChatBarRecordBtnLongTapEnded"
/* ============================== 与网络交互后返回 ============================== */
public let kNoteWeChatGoBack = "noteWeChatGoBack"

// MARK:- SDK
public let kAppKey = "8c05fc8cf099c153dcb5f2daec46821d"
