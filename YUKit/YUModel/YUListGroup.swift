//
//  YUListGroup.swift
//  three
//
//  Created by chenliangyu on 2016/11/22.
//  Copyright © 2016年 ioschen. All rights reserved.
//

import UIKit

open class YUListGroup: NSObject {

    //用一个模型来描述每组的信息：组头、组尾、这组的所有行模型
    public var groupheader: String?
    public var grougfooter: String?
    
    //这组的所有行模型
    public var items = [YUListItem]()
}
