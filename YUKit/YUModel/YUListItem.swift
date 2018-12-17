//
//  YUListItem.swift
//  three
//
//  Created by chenliangyu on 2016/11/22.
//  Copyright © 2016年 ioschen. All rights reserved.
//

import UIKit

open class YUListItem: NSObject {
    public enum CellType {
        case Rows
        case Default
        case Detail
        case QRCode
        case Switch
        case Head
        
        /// 主文字 下面小字 右边小字
        case Three
    }
    
    public var icon: UIImage?           //图标
    public var title: String?          //标题
    public var subtitle: String?       //子标题
    public var othertitle: String?       //其他标题
    public var badgeValue: String?     //右边显示的提醒数字
    public var destVcClass: AnyClass?  //点击这行cell,需要跳转到哪个控制器
    public var detailUrl: String?
    public var operation: () -> () = {} //var (^operation)(): void    //block
    public var state: Bool = true
    public var type: CellType?
    public var rows: [TableDefault]?
    
    //主要用来透视显示选择列表的
    public var lists = [String]() //["主卧","次卧","厨房","卫生间"]
    
    public init(_ title: String, _ icon: UIImage) {
        super.init()
        self.title = title
        self.icon = icon
    }
    
    public init(_ title: String, _ subtitle: String) {
        super.init()
        self.title = title
        self.subtitle = subtitle
    }
    
    public init(title: String, subtitle: String = "1", icon: UIImage = UIImage()) {
        super.init()
        self.title = title
        self.icon = icon
        self.subtitle = subtitle
    }
    
    public init(title: String, subtitle: String = "1",othertitle: String, icon: UIImage = UIImage()) {
        super.init()
        self.title = title
        self.icon = icon
        self.subtitle = subtitle
        self.othertitle = othertitle
    }
    
    public init(title: String, subtitle: String,othertitle: String, type: CellType?) {
        super.init()
        self.title = title
        self.type = type
        self.subtitle = subtitle
        self.othertitle = othertitle
    }
    
    
    /// model初始化
    ///
    /// - Parameters:
    ///   - title: 大标题
    ///   - subtitle: 副标题
    ///   - type: 类型
    public init(title: String,subtitle: String = "1",type: CellType?) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
    
    public init(title: String, subtitle: String = "1",type: CellType?,rows: [TableDefault]?) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.rows = rows
    }
}
