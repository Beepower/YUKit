//
//  UIButtonExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 16/2/1.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    public class func initWithC(_ tag: Int,frame: CGRect,imgName: String,target: AnyObject?, action: Selector) -> UIButton {
        let button = UIButton(frame: frame)
        button.setBackgroundImage(UIImage(named: imgName), for: UIControl.State.normal)
        button.tag = tag
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        return button
    }
    
    /// 设备背景色 生成背景图片
    ///
    /// - Parameters:
    ///   - color: 背景色
    ///   - state: 按钮状态
    public func setBackgroundColor(color: UIColor,state: UIControl.State){
        self.setBackgroundImage(color.toImage(), for: state)
    }
}
