//
//  YUDefineColor.swift
//  PowerCC
//
//  Created by chenliangyu on 16/5/9.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit

//MARK: - 登录部分

public func RGBAColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

public func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

public func PRGBColor(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

public let YUBGCOLOR = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.00)


public let LOGINBGCOLOR = UIColor(red:0.53, green:0.84, blue:0.97, alpha:1.00)
public let LOGINBUTTONCOLOR = UIColor(red:0.76, green:0.07, blue:0.16, alpha:1.00)

/// 导航栏
public let NAVCOLOR = UIColor(red:0.32, green:0.52, blue:0.98, alpha:1.00)

public let wxColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.00)
//这个是老款色彩UIColor(red: 201.0 / 255.0, green: 202.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
public let wxChatColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)

//UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
//原本微信色是这个UIColor(red:0.94, green:0.94, blue:0.96, alpha:1) 现在微信色就是背景色

public let airColor = UIColor(red: 0.92, green: 0.93, blue: 0.93, alpha: 1)
public let whiteS = UIColor(red:1, green:1, blue:1, alpha:0.7)

public let LOGINTEXTCOLOR = UIColor(red:0.79, green:0.79, blue:0.79, alpha:1.00)

public let WHITECOLOR = UIColor.white

//MARK: - TabBar部分
//public let TabBarTColor = UIColor(red: 0.12, green: 0.58, blue: 0.13, alpha: 1)
//public let TabBarTColor = UIColor(red: 0, green: 202, blue: 255, alpha: 1)
/// tabbar的字体颜色
public let TabBarTColor = UIColor(red:0.62, green:0.62, blue:0.62, alpha:1.00)
//UIColor.grayColor()
/// tabbar的高亮颜色
public let TabBarHTColor = UIColor(red:0.32, green:0.52, blue:0.98, alpha:1.00)

/// 场景文字和图标颜色
public let sceneColor = UIColor.gray
/// 场景文字和图标高亮颜色
public let sceneHighColor = UIColor(red:0.56, green:0.76, blue:0.20, alpha:1.00)
