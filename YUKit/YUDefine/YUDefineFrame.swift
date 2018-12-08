//
//  YUDefineFrame.swift
//  PowerCC
//
//  Created by chenliangyu on 16/5/9.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit

public let IPHONEFIVE: CGFloat = 320.0
public let IPHONESEVEN: CGFloat = 375.0
public let IPHONEPLUS: CGFloat = 414.0

extension UIDevice {
    //812pt x 375pt @3x
    
    /// 是不是iPhone X
    ///
    /// - Returns: 是不是iPhone X
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}

//4s 640x960
/// iPhone5的高度
public let IFIVEH: CGFloat = 568.0 //640x1136
public let ISIXH: CGFloat = 667.0 //750x1334


//电池20 navbar44 tabbar49

//主页上得各种高度的变量
/// 100
public let TABLE_CELL_HEIGHT: Float = 100
/// 24
public let SECTION_HEIGHT: Float = 24
/// 80
public let SCROLL_HEIGHT: Float = 80
/// 400
public let IMAGE_HEIGHT: Float = IN_WINDOW_HEIGHT+200
/// 200
public let IN_WINDOW_HEIGHT: Float = UIScreen.main.bounds.height > 1000 ? 300 : 200
/// 44
public let TITLE_HEIGHT: Float = 44

public let FONT_SIZE: CGFloat = UIScreen.main.bounds.height > 1000 ? 20 : 16


/// UIScreen.main.bounds.size.width
public let BWIDTH: CGFloat = UIScreen.main.bounds.size.width
/// UIScreen.main.bounds.size.height
public let BHEIGHT: CGFloat = UIScreen.main.bounds.size.height

public let TABBARH: CGFloat = 49
public let BATTERYH: CGFloat = 20
public let NAVBARH: CGFloat = 44
/// 状态栏和nav高度和
public let BATTERYNAV: CGFloat = 64
/// 去掉状态栏和nav高度
public let NOBATTERYNAV: CGFloat = BHEIGHT - BATTERYNAV
/// 去掉状态栏后高度的一半
public let ONENOBATTERYNAV: CGFloat = (BHEIGHT - BATTERYNAV)/2
/// 去掉状态栏和tabbar后高度的一半
public let ONENOBATTERYNAVTAB: CGFloat = (BHEIGHT - BATTERYNAV - TABBARH)/2

///两个的间距缩短  主要给rightbaritem使用
public let NAVITEMEDGE: UIEdgeInsets = UIEdgeInsetsMake(0, 15, 0, -20)

