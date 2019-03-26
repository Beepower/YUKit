//
//  UIViewRedPointExtension.swift
//  X
//
//  Created by chen on 2017/8/4.
//  Copyright © 2017年 chen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    //#pragma other(redPoint)
    //添加显示
    public func showRedAt(offsetX: CGFloat,offsetY: CGFloat,value: String?) {
        
        var myoffsetX = offsetX
        var myoffsetY = offsetY
        self.removeRedPoint()//添加之前先移除，避免重复添加
        
        //新建小红点
        let badgeView = UIView()
        badgeView.tag = 998
    
        var viewWidth: CGFloat = 12
        if value != nil {
            viewWidth = 18
            let valueLabel = UILabel()
            valueLabel.frame = CGRect(0, 0, viewWidth, viewWidth)
            valueLabel.text = value
            valueLabel.font = UIFont.systemFont(ofSize: 12)
            valueLabel.textColor = UIColor.white
            valueLabel.textAlignment = .center
            valueLabel.clipsToBounds = true
            badgeView.addSubview(valueLabel)
        }
    
        badgeView.layer.cornerRadius = viewWidth / 2
        badgeView.backgroundColor = UIColor.red
        let tabFrame: CGRect = self.frame
    
        //确定小红点的位置
        if myoffsetX == 0 {
            //offsetX = 1;
            myoffsetX = myoffsetX-viewWidth/2.0
        }
    
        if myoffsetY == 0 {
            //offsetY = 0.05;
            myoffsetY = myoffsetY-viewWidth/2.0
        }
        let x: CGFloat = CGFloat(ceilf(Float(tabFrame.size.width + myoffsetX)))
        var y: CGFloat = 0
        if (myoffsetY == -viewWidth/2.0) {
            y = CGFloat(ceilf(Float(myoffsetY)))
        }else{
            y = CGFloat(ceilf(Float(myoffsetY * tabFrame.size.height)))
        }
    
        badgeView.frame = CGRect(x, y, viewWidth, viewWidth)
        self.addSubview(badgeView)
    }
    
    /// 专门给头像大小等于view大小，右上角设置角标用
    ///
    /// - Parameter value: 角标数字 多位数直接显示...
    public func badgeNumber(_ value: Int64) {

        if value < 1 {
            self.removeBadgeNumber()
            return
        }

        self.removeRedPoint()//添加之前先移除，避免重复添加

        let viewWidth: CGFloat = 18

        //新建小红点
        let badgeView = UIView()
        badgeView.tag = 998
        badgeView.layer.cornerRadius = viewWidth / 2
        badgeView.backgroundColor = UIColor.red


        let tabFrame: CGRect = self.frame
        let wy: CGFloat = 2 //不半分 移动2
        //确定小红点的位置
        let x: CGFloat = tabFrame.origin.x + tabFrame.size.width - viewWidth / 2 + wy
        let y: CGFloat = tabFrame.origin.y - viewWidth / 2 + wy
        badgeView.frame = CGRect(x, y, viewWidth, viewWidth)

        let imageView: UIImageView = UIImageView(frame: CGRect(x, y, viewWidth, viewWidth))
        imageView.tag = 999
        imageView.image = #imageLiteral(resourceName: "red_point")
        self.superview?.addSubview(imageView)

        let valueLabel = UILabel(frame: CGRect(0, 0, viewWidth, viewWidth))
        if value > 99 {
            valueLabel.text = "..."
        }else {
            valueLabel.text = "\(value)"
        }
        valueLabel.font = UIFont.systemFont(ofSize: 12)
        valueLabel.textColor = UIColor.white
        valueLabel.textAlignment = .center
        valueLabel.clipsToBounds = true
        badgeView.addSubview(valueLabel)

        self.superview?.addSubview(badgeView)
        //self.addSubview(badgeView)
    }
    
    
    //隐藏
    public func hideRedPoint() {
        self.removeRedPoint()
    }
    
    //移除
    public func removeBadgeNumber() {
        //按照tag值进行移除
        for subView: UIView in (self.superview?.subviews)! {
            if subView.tag == 998 || subView.tag == 999{
                subView.removeFromSuperview()
            }
        }
    }
    
    //移除
    public func removeRedPoint() {
        //按照tag值进行移除
        for subView: UIView in self.subviews {
            if subView.tag == 998 || subView.tag == 999{
                subView.removeFromSuperview()
            }
        }
    }
    
    //MARK: Tabbar(redPoint)
    //显示小红点
    public func showBadgeOnItemIndex(index: Int) {
        let keyStr = "\(index)_HADSET"
        if (YUDefaults.string(forKey: keyStr) != nil){
            return
        }else {
            YUDefaults.set("HADSET", forKey: keyStr)
        }
        //移除之前可能存在的小红点
        self.removeBadgeOnItemIndex(index: index)
    
        //新建小红点
        let badgeView = UIView()
        badgeView.tag = 888 + index
        badgeView.layer.cornerRadius = 6
        badgeView.backgroundColor = UIColor.red
        let tabFrame: CGRect = self.frame
    
        //确定小红点的位置
        let percentX: CGFloat = (CGFloat(index) + 0.55) / 5 //5为tabbaritem的总个数
        let x: CGFloat = CGFloat(ceilf(Float(percentX * tabFrame.size.width)))
        let y: CGFloat = CGFloat(ceilf(Float(0.05 * tabFrame.size.height)))
        badgeView.frame = CGRect(x, y, 12, 12)
        self.addSubview(badgeView)
    }
    
    //隐藏小红点
    public func hideBadgeOnItemIndex(index: Int) {
        let keyStr: String = "\(index)_HADSET"
        //移除小红点
        self.removeBadgeOnItemIndex(index: index)
        if (YUDefaults.string(forKey: keyStr) != nil) {
            YUDefaults.removeObject(forKey: keyStr)
        }
    }
    
    //移除
    public func removeBadgeOnItemIndex(index: Int) {
        //按照tag值进行移除
        for subView: UIView in self.subviews {
            if subView.tag == 888+index {
                subView.removeFromSuperview()
            }
        }
    }
    
}

class BadgeView: UIView {
    
    var valueLabel: UILabel!
    
    //UInt64
    var value: Int64 = 0 {
        didSet {
            if value > 99 {
                valueLabel.text = "..."
            }else {
                valueLabel.text = "\(value)"
            }
        }
    }
    
    ///新建小红点
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewWidth: CGFloat = 18
        let wy: CGFloat = 2 //不半分 移动2
        //确定小红点的位置
        let x: CGFloat = self.frame.origin.x + self.frame.size.width - viewWidth / 2 + wy
        let y: CGFloat = self.frame.origin.y - viewWidth / 2 + wy
        self.frame = CGRect(x, y, viewWidth, viewWidth)
        
        
        self.layer.cornerRadius = viewWidth / 2
        self.backgroundColor = UIColor.red
        
//        let imageView: UIImageView = UIImageView(frame: CGRect(x, y, viewWidth, viewWidth))
//        imageView.image = #imageLiteral(resourceName: "red_point")
//        self.addSubview(imageView)
        
        valueLabel = UILabel(frame: CGRect(0, 0, viewWidth, viewWidth))
        valueLabel.font = UIFont.systemFont(ofSize: 12)
        valueLabel.textColor = UIColor.white
        valueLabel.textAlignment = .center
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
