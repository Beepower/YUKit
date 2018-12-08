//
//  YUShake.swift
//  PowerCC
//
//  Created by chenliangyu on 2016/7/4.
//  Copyright © 2016年 Whale. All rights reserved.
//

import UIKit

protocol Shakeable {
}

// 你可以只为 UIView 添加 shake 方法！
extension Shakeable where Self: UIView {

    // shake 方法的默认实现
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}
