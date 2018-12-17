//
//  TableDefault.swift
//  X
//
//  Created by chen on 2017/6/20.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

public struct TableDefault {
    public var id: String!
    public var name: String?
    public var icon: UIImage?
    public var iconUrl: String?
    public var detail: String?
    public var isTrue: Bool?
    public var destVcClass: AnyClass?  //点击这行cell,需要跳转到哪个控制器
    public var operation: (() -> ())?
    //var operation: () -> () = {} //var (^operation)(): void    //block
    
    
    /// 用户名图标
    ///
    /// - Parameters:
    ///   - name: 用户名
    ///   - icon: 图标
    public init(_ name: String?, _ icon: UIImage?) {
        self.name = name
        self.icon = icon
    }
    
    public static func initDefault(name: String?,icon: UIImage?) -> TableDefault {
        return TableDefault(id: "", name: name, icon: icon, iconUrl: nil, detail: nil, isTrue: nil, destVcClass: nil, operation: nil)
    }
    
    
    /// 初始化带图
    ///
    /// - Parameter icon: 图
    public init(icon: UIImage?) {
        self.icon = icon
    }
    
    /// 初始化带图
    ///
    /// - Parameter icon: 头像
    public static func initIcon(icon: UIImage?) -> TableDefault {
        return TableDefault(id: "", name: "", icon: icon, iconUrl: nil, detail: nil, isTrue: nil, destVcClass: nil, operation: nil)
    }
    
    public init(id: String!, name: String?, icon: UIImage?, iconUrl: String?, detail: String?, isTrue: Bool?, destVcClass: AnyClass?, operation: (() -> ())?) {
        self.id = id
        self.name = name
        self.icon = icon
        self.iconUrl = iconUrl
        self.detail = detail
        self.isTrue = isTrue
        self.destVcClass = destVcClass
        self.operation = operation
    }
    
    
    /// 用户名 详情
    ///
    /// - Parameters:
    ///   - name: 用户名
    ///   - detail: 详情
    public init(name: String?,detail: String?) {
        self.name = name
        self.detail = detail
    }
    
    public static func initWen(name: String?,detail: String?) -> TableDefault {
        return TableDefault(id: "", name: name, icon: nil, iconUrl: nil,detail: detail, isTrue: nil, destVcClass: nil, operation: nil)
    }
    
    
    /// 用户名副标题头像
    ///
    /// - Parameters:
    ///   - name: 用户名
    ///   - icon: 头像
    ///   - detail: 副标题
    public init(name: String?,icon: UIImage?,detail: String?) {
        self.name = name
        self.icon = icon
        self.detail = detail
    }
    
    public static func initChat(name: String?,icon: UIImage?,detail: String?) -> TableDefault {
        return TableDefault(id: "", name: name, icon: icon, iconUrl: nil, detail: detail, isTrue: nil, destVcClass: nil, operation: nil)
    }
}
