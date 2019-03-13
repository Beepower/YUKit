//
//  UIViewExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 16/1/11.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView的扩展方法，方便工程全局使用扩展方法来创建或者使用所有继承于UIView的控件

/// 方向 方位
///
/// - s: 上 北
/// - x: 下 南
/// - z: 左 西
/// - y: 右 东
public enum YUDirection {
    case s,x,z,y
}
extension UIView {
    
    /// 获取或设置width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.width = self.frame.size.width
        }
    }
    
    /// 获取或设置height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.height = self.frame.size.height
        }
    }
    
    /// 获取或设置origin.x
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.x = self.frame.origin.x
        }
    }
    
    /// 获取或设置origin.y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.y = self.frame.origin.y
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.x = self.center.x
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.y = self.center.y
        }
    }
    
    public func size() -> CGSize {
        return self.frame.size
    }
    
    public func size(_ size: CGSize) {
        var rect = self.frame
        rect.size = size
        self.frame = rect
    }
    
    
    /**
     获取或设置origin
     
     - returns: 获取或设置origin
     */
    public func origin() ->CGPoint {
        return self.frame.origin
    }
    
    public func origin(_ origin: CGPoint) {
        var rect = self.frame
        rect.origin = origin
        self.frame = rect
    }
    
    /**
     获取rightX
     
     - returns: 获取rightX
     */
    public func rightX() ->CGFloat {
        return x + width
    }
    
    /**
     获取或设置bottomY
     
     - returns: 获取或设置bottomY
     */
    public func bottomY() ->CGFloat {
        return y + height
    }
    
    public func bottomY(_ bottomY: CGFloat) {
        var rect = self.frame
        rect.origin.y = bottomY - height
        self.frame = rect
    }
    
    public func addTopBorder(color: UIColor,borderWidth: CGFloat) {
        let border: CALayer = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0,width: self.width,height: borderWidth)
        self.layer.addSublayer(border)
    }
    public func addBottomBorder(color: UIColor,borderWidth: CGFloat){
        let border: CALayer = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0,y: self.height - borderWidth,width:  self.width,height: borderWidth)
        self.layer.addSublayer(border)
    }
    public func addLeftBorder(color: UIColor,borderWidth: CGFloat){
        let border: CALayer = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: borderWidth,height:  self.height)
        self.layer.addSublayer(border)
    }
    public func addRightBorder(color: UIColor,borderWidth: CGFloat){
        let border: CALayer = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.width - borderWidth, y: 0,width: borderWidth,height: self.height)
        self.layer.addSublayer(border)
    }
    
    public func addBorder(direction: [YUDirection],color: UIColor,borderWidth: CGFloat) {
        if direction.contains(.s) {
            self.addTopBorder(color: color, borderWidth: borderWidth)
        }
        if direction.contains(.x) {
            self.addBottomBorder(color: color, borderWidth: borderWidth)
        }
        if direction.contains(.y) {
            self.addRightBorder(color: color, borderWidth: borderWidth)
        }
        if direction.contains(.z) {
            self.addLeftBorder(color: color, borderWidth: borderWidth)
        }
    }
    
    /// 加入单击
    ///
    /// - Parameters:
    ///   - target: target description
    ///   - action: action description
    public func tapRecognizer(target: AnyObject?, action: Selector) {
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapRecognizer)
    }
    
    
    /// 空气质量项目渐变
    ///
    /// - Returns:
    public func jbColor() {
        //渐变颜色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        //设置渐变的主颜色（可多个颜色添加）
        gradientLayer.colors = [UIColor(red:0.02, green:0.26, blue:0.45, alpha:1.00).cgColor, UIColor(red:0.11, green:0.67, blue:0.90, alpha:1.00).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        //开始到结尾是方向，这个就是从左到右渐变
        //将gradientLayer作为子layer添加到主layer上
        self.layer.addSublayer(gradientLayer)
    }
    
    
    public enum BorderDirection {
        case left
        case right
        case top
        case bottom
    }
}

extension CGRect {
    
    /// 初始化CGRect
    ///
    /// - Parameters:
    ///   - x: x
    ///   - y: y
    ///   - width: 宽度
    ///   - height: 高度
    public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// 初始化CGRect（0,0屏幕宽度,高度）
    ///
    /// - Parameter height: 高度
    public init(_ height: CGFloat) {
        self.init(x: 0, y: 0, width: BWIDTH, height: height)
    }
}

//extension UIView {
//    public convenience init(_ frame: CGRect) {
//        self.init(frame)
//    }
//}
