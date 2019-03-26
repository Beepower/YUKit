//
//  DataExtension.swift
//  X
//
//  Created by chen on 2017/6/28.
//  Copyright © 2017年 chen. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    ///用柯里化再写个转data的方法

    /// 输入字节内容
    ///
    /// - Parameter jz: 进制
    public func arrayByte(jz: Int = 10) {
        YUPrint(self.count)
        var a = "["
        for i in 0..<self.count {
            let new = String(self[i],radix:jz)
            a.append("\(new) ")
        }
        YUPrint(a+"]")
    }
    
    public func toImage() -> UIImage {
        //return UIImage(data: self)
        return UIImage(data: self, scale: 1.0)!
    }
    
    //let startIndex = result.value.startIndex
    //let endIndex = result.value.startIndex.advanced(by: Int(value[1])!)
    //let ambientData = result.value.subdata(in: startIndex..<endIndex)
    
    public init<T>(fromArray values: [T]) {
        var values = values
        self.init(buffer: UnsafeBufferPointer(start: &values, count: values.count))
    }
    
//    public func toArray<T>(type: T.Type) -> [T] {
//        return self.withUnsafeBytes {
//            [T](UnsafeBufferPointer(start: $0, count: self.count/MemoryLayout<T>.stride))
//        }
//    }
}
