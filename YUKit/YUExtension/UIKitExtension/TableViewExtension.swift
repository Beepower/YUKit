//
//  TableViewC.swift
//  PowerCC
//
//  Created by chenliangyu on 15/12/28.
//  Copyright © 2015年 Whale. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    /// 隐藏空白下划线
    public func hideEmptyCells() {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        self.tableFooterView = view
    }
    
    /// 滑动到最下面一个cell 聊天常用
    public func scrollToBottomReload(_ reload: Bool) {
        if reload {
            self.reloadData()
        }
        let nos = self.numberOfSections
        let nor = self.numberOfRows(inSection: nos - 1)
        if nor > 1 {
            let lastPath:IndexPath = IndexPath(row:nor - 1, section:nos - 1)
            self.scrollToRow( at: lastPath , at: .bottom, animated: false)
            //self.scrollToRow( at: lastPath , at: .bottom, animated: true)
        }
    }

    public func scrollViewToBottom(animated: Bool) {
        if self.contentSize.height > self.frame.size.height {
            let offset: CGPoint = CGPoint.init(x: 0, y: self.contentSize.height - self.frame.size.height)
            self.setContentOffset(offset, animated: animated)
        }
    }
    
    
    /// 加入点击和拖拽事件
    public func touchAndDrag(target: Any?, action: Selector?) {
        self.keyboardDismissMode = .onDrag
        // ------tableView 上添加的自定义手势
        let tableViewGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        tableViewGesture.numberOfTapsRequired = 1//几个手指点击
        tableViewGesture.cancelsTouchesInView = false//是否取消点击处的其他action
        self.addGestureRecognizer(tableViewGesture)
    }
    
    //去除单元格分隔线
    //self.tableView.separatorStyle = .none
    
    public func hideSeparatorLeftInset() {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets.zero
        }
        if self.responds(to: #selector(setter: UIView.layoutMargins)) {
            self.layoutMargins = UIEdgeInsets.zero
        }
    }
    
    /// 没有数据源或者为空显示的文本
    ///
    /// - Parameters:
    ///   - message: 文本内容
    ///   - rowCount: 数据源个数
    public func nodataTitle(_ message: String,_ rowCount: Int){
        if (rowCount == 0) {
            // Display a message when the table is empty
            // 没有数据的时候，UILabel的显示样式
            let messageLabel: UILabel = UILabel()
            messageLabel.text = message
            messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
            messageLabel.textColor = UIColor.lightGray
            messageLabel.textAlignment = .center
            messageLabel.sizeToFit()
            self.backgroundView = messageLabel
            self.separatorStyle = .none
        } else {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
    }
    
    /// 没有数据的时候显示view
    ///
    /// - Parameters:
    ///   - view: view
    ///   - rowCount: 返回数量
    public func nodataView(_ view: UIView,_ rowCount: Int) -> Int {
        if (rowCount == 0) {
            self.backgroundView = view
            self.separatorStyle = .none
        } else {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
        return rowCount
    }
    
    /**
     设置分组TableView的头部section高
     */
    public func setGroupHeaderFrame() {
        //MARK: - 可以参考设置页面
        self.sectionFooterHeight = 0;
        //self.tableView.sectionHeaderHeight = 18;
        self.contentInset = UIEdgeInsetsMake(20-36, 0, 0, 0)
        //self.tableView.backgroundColor=[UIColor redColor];//设置全局背景色YYGlobalBg;
        //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        //self.tableView.hideSeparatorLeftInset()
        //self.tableView.showsVerticalScrollIndicator=NO;//不显示水平滚动条
    }
    
    /**
     设置分组TableView的头部section高
     */
    public func setGroupHeaderFrame(x: CGFloat) {
        //MARK: - 可以参考设置页面
        self.sectionFooterHeight = 0;
        //self.tableView.sectionHeaderHeight = 18;
        self.contentInset = UIEdgeInsetsMake(20-36-x, 0, 0, 0)
        //self.tableView.backgroundColor=[UIColor redColor];//设置全局背景色YYGlobalBg;
        //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        //self.tableView.hideSeparatorLeftInset()
        //self.tableView.showsVerticalScrollIndicator=NO;//不显示水平滚动条
    }
    
    /**
     顶边距为0
     */
    public func setGroupHeaderZeroFrame() {
        self.sectionFooterHeight = 0;
        self.contentInset = UIEdgeInsetsMake(20-36-20, 0, 0, 0)
    }
    
    
    public func setGroupHeaderZeroFrame(x: CGFloat) {
        self.sectionFooterHeight = 0;
        self.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0)
    }
    
}

//extension UITableViewCell {
//    func hideSeparatorLeftInset() {
//        if self.respondsToSelector("setLayoutMargins:") {
//            self.layoutMargins = UIEdgeInsetsZero
//        }
//    }
//}


/// TVC专用
public protocol Reusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    // 我喜欢使用类名来作为标识符
    // 所以这里可以用类名返回一个默认值
    public static var reuseIdentifier: String { return String(describing: Self.self) }
    public static var nib: UINib? { return nil }
}




//extension NSObject {
//    static var iden: String {
//        return NSStringFromClass(self)
//    }
//}
//
//extension UITableView {
//    func registerCustomClass(cellClass: AnyClass?) {
//        registerClass(cellClass, forCellReuseIdentifier: cellClass?.iden ?? "")
//    }
//    
//    func dequeueCustomCellWithIdentifier<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath) -> T {
//        return dequeueReusableCellWithIdentifier(T.iden, forIndexPath: indexPath) as! T
//    }
//}

extension UITableView {
    /**
     注册cell类
     - parameter _: 类型
     */
    public func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    public func aregisterReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
//    func adequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
//        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
//    }
    
    public func adequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}

extension UICollectionView {
    public func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    public func registerReusableSupplementaryView<T: Reusable>(_ elementKind: String, _: T.Type) {
        if let nib = T.nib {
            self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionViewCell>(_ elementKind: String, indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}



//func dequeueReusableCell<T: Reusable>(indexPath indexPath: NSIndexPath) -> T {
//    return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
//}
//
//let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MyCustomCell
