//
//  YUWindow.swift
//  BeePowerPerson
//
//  Created by CLY on 2017/2/10.
//  Copyright © 2017年 ioschen. All rights reserved.
//

import UIKit

class YUWindow: UIWindow {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.windowLevel = UIWindowLevelAlert
//        //UIWindowLevel优先级顺序为: .Alert > .StatusBar > .Normal
//        self.backgroundColor = UIColor.clear
//        self.becomeKey()
    
        let label = UILabel(frame: CGRect(x: BWIDTH/8, y: BHEIGHT/2-90, width: BWIDTH/8*6, height: 30))
        self.addSubview(label)
        label.backgroundColor = NAVCOLOR
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.text = "当日营业额"
    }
    
    func show() {
        self.makeKeyAndVisible()
        self.isHidden = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hiddenClick() {
        self.resignKey()
        self.isHidden = true
    }
    
}
