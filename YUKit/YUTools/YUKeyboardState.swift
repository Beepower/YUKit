//
//
//  Created by 中良 on 16/6/1.
//  Copyright © 2016年 Whale. All rights reserved.
//
//                          _oo0oo_
//                         088888880
//                         88" . "88
//                         (| -_- |)
//                          0\ = /0
//                       ___/'---'\___
//                     .' \\|     |// '.
//                    / \\|||  :  |||// \
//                   /_ ||||| -:- |||||- \
//                  |   | \\\  -  /// |   |
//                  | \_|  ''\---/''  |_/ |
//                  \  .-\__  '-'  __/-.  /
//                ___'. .'  /--.--\  '. .'___
//             ."" '<  '.___\_<|>_/___.' >'  "".
//            | | : '-  \'.;'\ _ /';.'/ - ' : | |
//            \  \ '_.   \_ __\ /__ _/   .-' /  /
//        ====='-.____'.___ \_____/___.-'____.-'=====
//                          '=---='
//
//            微信号:ioschen
//            博客地址:http://ioschen.com
//
//  YUKeyboardState.swift
//  PowerCC
//

import UIKit

class YUKeyboardState: NSObject {

    //    这个单例在初始化方法init种监听2个事件，分别是
    //    UIKeyboardDidShowNotification（键盘弹出通知）和
    //    UIKeyboardWillHideNotification （键盘消失通知 然后在相应的方法中设置一个属性就行了。
    //
    //    大致的实现如下：
    //    －（id）init
    //    {
    //    self = [super init];
    //    if (self)
    //    {
    //    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //    [center  addObserver:self selector:@selector(keyboardDidShow)  name:UIKeyboardDidShowNotification  object:nil];
    //    [center addObserver:self selector:@selector(keyboardDidHide)  name:UIKeyboardWillHideNotification object:nil];
    //    _keyboardIsVisible = NO;
    //    }
    //    return self;
    //    }
    //
    //    - (void)keyboardDidShow
    //    {
    //    _keyboardIsVisible = YES;
    //    }
    //
    //    - (void)keyboardDidHide
    //    {
    //    _keyboardIsVisible = NO;
    //    }
    //    
    //    - (BOOL)keyboardIsVisible
    //    {
    //    return _keyboardIsVisible;
    //    }
}
