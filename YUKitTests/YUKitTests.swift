//
//  YUKitTests.swift
//  YUKitTests
//
//  Created by chen on 2017/10/31.
//  Copyright © 2017年 chen. All rights reserved.
//

import XCTest
import YUKit
//@testable import YUKit

class YUKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testhehe() {
        
        let t = "1535904000000"
        print("\(t.timeStampDate())")
        
        
        
        let a: Int64 = 1512024214418
        let b = a.chatTime()
        print("我们测试 \(b)")
        print(a.greenWichTime())
        
        let aaaa = "里1"
        print(aaaa.PY())
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let a = "ndl"
        print(a.count+1)
        
        //正则: 11 17 16 ? * , 周: 0,0,1,0,0,0,0
        //let cronWeek = datePicker.date.cronWeekTime(cronweeks: cronWeekString(repeatTimeStrings))
        //let cronWeek = Date().cronWeekTime(cronweeks: <#T##String#>)
        let repeatTimeStrings = "0,0,1,1,0,0,0"
        let weeks = repeatTimeStrings.components(separatedBy: ",")
        var cronweek = ""
        if weeks[6] == "1" {
            cronweek = cronweek+"1,"
        }
        if weeks[0] == "1" {
            cronweek = cronweek+"2,"
        }
        if weeks[1] == "1" {
            cronweek = cronweek+"3,"
        }
        if weeks[2] == "1" {
            cronweek = cronweek+"4,"
        }
        if weeks[3] == "1" {
            cronweek = cronweek+"5,"
        }
        if weeks[4] == "1" {
            cronweek = cronweek+"6,"
        }
        if weeks[5] == "1" {
            cronweek = cronweek+"7,"
        }
        print(cronweek)
        //
        let c = cronweek.dropLast()
        print(c)
        YUPrint("hehe")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
