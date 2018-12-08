//
//  UIAlertViewControllerExtenstion.swift
//  X
//
//  Created by chen on 2017/7/25.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

// MARK: - UIAlertController的扩展方法，方便工程全局使用扩展方法来创建或者使用提示
extension UIAlertController {
    class func show(_ title: String,_ cancleTitle: String = "确定",form: UIViewController) {
        let alertController = UIAlertController(title: title,message: "",preferredStyle: .alert)
        let okAction = UIAlertAction(title: cancleTitle, style: .cancel,handler: nil)
        alertController.addAction(okAction)
        form.present(alertController, animated: true, completion: nil)
    }
    class func show(_ title: String = "温馨提示", message: String,form: UIViewController) {
//        let alertView = UIAlertView()
//        alertView.title = title
//        alertView.message = message
//        alertView.addButton(withTitle: "确定")
//        alertView.addButton(withTitle: "取消")
//        alertView.show()
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "确定", style: .default, handler: { (alertAction) in
        })
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        form.present(alertController, animated: true, completion: nil)
    }
}
