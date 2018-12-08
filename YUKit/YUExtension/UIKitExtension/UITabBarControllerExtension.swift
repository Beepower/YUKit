//
//  UITabBarControllerExtension.swift
//  AirQuality
//
//  Created by chen on 2017/8/14.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    //    let blurBackView = UIView()
    //    blurBackView.frame = CGRect(x: 0, y: -20, width: kScreenW, height: 64)
    //    let gradintLayer = CAGradientLayer()
    //    gradintLayer.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 64)
    //    gradintLayer.colors = [
    //    UIColor.hexInt(0x040012).withAlphaComponent(0.76).cgColor,
    //    UIColor.hexInt(0x040012).withAlphaComponent(0.28).cgColor
    //    ]
    //    gradintLayer.startPoint = CGPoint(x: 0, y: 0)
    //    gradintLayer.endPoint = CGPoint(x: 0, y: 1.0)
    //    blurBackView.layer.addSublayer(gradintLayer)
    //    blurBackView.isUserInteractionEnabled = false
    //    blurBackView.alpha = 0.5
    //
    //    // 设置导航栏样式
    //    navigationBar.barStyle = .black
    //    navigationBar.insertSubview(blurBackView, at: 0)
    
    
    /// UITabBar角标
    ///
    /// - Parameters:
    ///   - number: 角标数字
    ///   - index: 第几个UITabBar
    public func tabBar(_ rowNumber: Int,index: Int) {
        let item = self.tabBar.items?[index]
        //self.tabBarController?.tabBar.items?[1]
        item?.badgeValue = "\(rowNumber)"
        if rowNumber == 0 {
            item?.badgeValue = nil
        }
    }
    
    public func tabBarAndBadge(_ rowNumber: Int,index: Int) {
        let item = self.tabBar.items?[index]
        //self.tabBarController?.tabBar.items?[1]
        item?.badgeValue = "\(rowNumber)"
//        UIApplication.shared.applicationIconBadgeNumber = rowNumber
        if rowNumber == 0 {
            item?.badgeValue = nil
//            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
