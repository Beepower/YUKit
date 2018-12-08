//
//  YUTabBarItem.swift
//  YUKit
//
//  Created by chen on 2018/1/9.
//  Copyright © 2018年 chen. All rights reserved.
//

import UIKit

/// tabbar需要的参数
open class YUTabBarItem: NSObject {
    public var title = ""
    public var image = UIImage()
    public var selectedImage = UIImage()
    public var childVC = UIViewController()
    
    public init(_ title: String,_ image: UIImage,_ selectedImage: UIImage,_ childVC: UIViewController) {
        super.init()
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.childVC = childVC
    }
}
