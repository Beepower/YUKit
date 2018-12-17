//
//  UIViewControllerExtension.swift
//  X
//
//  Created by chen on 2017/8/23.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK:UIAlertController快速展示
    public func showAlert(_ title: String,_ cancleTitle: String = "确定") {
        let alertController = UIAlertController(title: title,message: "",preferredStyle: .alert)
        let okAction = UIAlertAction(title: cancleTitle, style: .cancel,handler: nil)
        alertController.addAction(okAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /// 显示取消和确认
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message
    ///   - handler: handler
    public func showCanOKAlert(_ title: String?, message: String? = nil,handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
        let cancle = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancle)
        let ok = UIAlertAction(title: "确认", style: .default, handler: handler)
        alertController.addAction(ok)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    /// 显示返回和另一个按钮
    ///
    /// - Parameters:
    ///   - title: title description
    ///   - okTitle: 另一个按钮文字
    public func showAlertCancleOk(cancleTitle: String = "取消",_ okTitle: String,_ title: String,alertAction: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: okTitle, style: .default, handler: alertAction)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /// 显示弹框
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息
    ///   - cancleTitle: 返回
    ///   - handler: 确认回掉
    public func showAlert(_ title: String,_ message: String, _ cancleTitle: String,handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
        let okAction = UIAlertAction(title: cancleTitle, style: .cancel,handler: handler)
        alertController.addAction(okAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlert(_ title: String,_ cancleTitle: String = "确定",handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title,message: "",preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: handler)
        alertController.addAction(cancleAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlertMessage(_ message: String,_ cancleTitle: String = "确定",handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: "内容",message: message,preferredStyle: .alert)
        let okAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: handler)
        alertController.addAction(okAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// 确定取消
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - alertAction: alert
    public func showAlert(title: String,alertAction: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确认", style: .default, handler: alertAction)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlertThree(cancleTitle: String = "取消",title: String,twoTitle: String,_ threeTitle: String,alertAction: ((UIAlertAction) -> Void)?,alertActionT: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: cancleTitle, style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: twoTitle, style: .default, handler: alertAction)
        let archiveAction = UIAlertAction(title: threeTitle, style: .default, handler: alertActionT)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// 通用方法
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message
    ///   - preferredStyle: preferredStyle
    ///   - alertActions: [UIAlertAction]
    public func showAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for a in alertActions {
            alertController.addAction(a)
        }
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
//    var textAction: ((UITextField) -> Void)?
//    带有文本输入的聊天功能
//    public func showAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle,alertActions: [UIAlertAction],textActions: [textAction]?) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
//        if textAction
//        for a in alertActions {
//            alertController.addAction(a)
//        }
//        ///iPad用 当actionsheet时候用
//        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
//            alertController.popoverPresentationController?.sourceView = self.view //必须加
//            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
//        }
//        self.present(alertController, animated: true, completion: nil)
//    }
    
    
    /// 通用带一个输入框
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message
    ///   - preferredStyle: UIAlertControllerStyle
    ///   - alertActions: [UIAlertAction]
    ///   - textAction: textAction
    public func showAlert(title: String?, message: String?, preferredStyle: UIAlertControllerStyle,alertActions: [UIAlertAction],textAction: ((UITextField) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.addTextField(configurationHandler: textAction)
        for a in alertActions {
            alertController.addAction(a)
        }
        ///iPad用 当actionsheet时候用
        if alertController.responds(to: #selector(getter: popoverPresentationController)) {
            alertController.popoverPresentationController?.sourceView = self.view //必须加
            alertController.popoverPresentationController?.sourceRect = CGRect.init(0, BHEIGHT, BWIDTH, BHEIGHT)//可选，我这里加这句代码是为了调整到合适的位置
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
}

//extension UIAlertAction {
//    let alertAction = UIAlertAction(title: titles[i], style: styles[i], handler: actions[i])
//}
