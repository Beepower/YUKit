//
//  JSExt.swift
//  BeePowerPerson
//
//  Created by CLY on 2017/3/9.
//  Copyright © 2017年 ioschen. All rights reserved.
//

import Foundation

import JavaScriptCore

extension JSContext {
    public func loadJS(_ fileName: String) {
        let cryptoJSpatha = Bundle.main.path(forResource: fileName, ofType: "js")
        
//        do {
//            let content = try String(contentsOfFile:path!, encoding: String.Encoding.utf8)
//        } catch {
//            print("nil")
//        }
        
        YUPrint(cryptoJSpatha!)
        let cryptoJSa = try! String(contentsOfFile: cryptoJSpatha!, encoding: String.Encoding.utf8)
        _ = self.evaluateScript(cryptoJSa)
    }
}
