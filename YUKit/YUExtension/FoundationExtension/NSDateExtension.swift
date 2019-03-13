//
//  NSDateExtension.swift
//  PowerCC
//
//  Created by chenliangyu on 16/1/27.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation

extension String {
    
    public func toDate(_ formater: Formater) -> Date {
        let formatter = DateFormatter()
        //formatter.timeZone = TimeZone(abbreviation: "UTC")//
        formatter.dateFormat = formater.rawValue
        let day: Date = formatter.date(from: self)!
        YUPrint(day)
        return day
    }
    
    public func greentoHereTime() -> Date {
        // 要转换的日期字符串
        //let dateString(self) = "2011-05-03 23:11:40"
        
        let formatter = DateFormatter()
        // 设置为UTC时区
        // 这里如果不设置为UTC时区，会把要转换的时间字符串定为当前时区的时间（东八区）转换为UTC时区的时间
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let day: Date = formatter.date(from: self)!
        YUPrint(day)
        return day
    }
    
    
    /// 时间戳转化为时间
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 时间
    public func timeStampToString(timeStamp: String) -> Date {
        let string = NSString(string: timeStamp)
        let timeSta: TimeInterval = string.doubleValue
        let date = Date(timeIntervalSince1970: timeSta)
        YUPrint(date)
        return date
    }
    
    
    public func timeStampDate() -> Date {
        let string = NSString(string: self)
        let timeSta: TimeInterval = string.doubleValue/1000
        let date = Date(timeIntervalSince1970: timeSta)
        YUPrint(date)
        return date
    }
    
//    1535904000000
//
//    let t: TimeInterval = self.timeIntervalSince1970
//    //四舍五入法：精确到毫秒
//    let millisecond = CLongLong(round(t*1000))
//    return millisecond
    
}

extension Date {
    
    //Date().add(components: 1.day).toString(.ymd)
    //Date().add(components: 1.week).toString(.ymd)
    
    
    /// 获取当前时间年月日时分秒毫秒
    ///
    /// - Returns: 返回Int64
    public func intSF() -> Int64 {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day, .hour, .minute,.second,.nanosecond], from: Date())
        //let timeString = "\(comps.year!)"+"\(comps.month!)"+"\(comps.day!)"+"\(comps.hour!)"+"\(comps.minute!)"+"\(comps.second!)"+"\(comps.nanosecond!)"
        let timeString = "\(comps.year!)"+"\(comps.month!)"+"\(comps.day!)"+"\(comps.hour!)"+"\(comps.minute!)"+"\(comps.second!)"+"\(comps.nanosecond!/1000000)"
        //YUPrint("我的时间带皮秒"+timeString)
//        YUPrint("\(comps.nanosecond!)")
        return Int64(timeString)!
    }
    
    public var year: Int {
        get {
            return self.getOne().year
        }
    }
    public var month: Int {
        get {
            return self.getOne().month
        }
    }
    public var day: Int {
        get {
            return self.getOne().day
        }
    }
    public var hour: Int {
        get {
            return self.getOne().hour
        }
    }
    public var minute: Int {
        get {
            return self.getOne().minute
        }
    }
    public var second: Int {
        get {
            return self.getOne().second
        }
    }
    public var nanosecond: Int {
        get {
            return self.getOne().nanosecond
        }
    }
    public func getOne() -> (year: Int,month: Int,day: Int,hour: Int,minute: Int,second: Int,nanosecond: Int) {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day, .hour, .minute,.second,.nanosecond], from: self)
        return (comps.year!,comps.month!,comps.day!,comps.hour!,comps.minute!,comps.second!,comps.nanosecond!)
    }
    
    /// 获取这个月有多少天
    ///
    /// - Returns: 获取这个月有多少天
    public func getMonthHowManyDay() ->Int {
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的数量
        return (Calendar.current.range(of: .day, in: .month, for: self)?.count)!
    }
    
    
    /// 获取这个月第一天是星期几
    ///
    /// - Returns: 获取这个月第一天是星期几
    public func getMontFirstWeekDay() -> Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        //设置成第一天
        com.day = 1
        let date = calendar.date(from: com)
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的位置  ordinalityOfUnit
        let firstWeekDay = calendar.ordinality(of: .weekday, in: .weekOfMonth, for: date!)
        return firstWeekDay! - 1
    }
 
    //TODO: 代码待优化
    
    //TODO: 加减日月年
    
    /// 获取指定时间下一个月的时间
    ///
    /// - Returns: 获取指定时间下一个月的时间
    public func getNextDate() -> Date {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        com.month = com.month! + 1
        com.day = 1
        if com.month == Date().month {
            com.day = Date().day
        }
        return calendar.date(from: com)!
    }
    
    /// 获取指定时间上一个月的时间
    ///
    /// - Returns: 获取指定时间上一个月的时间
    public func getLastDate() -> Date {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        com.month = com.month!-1
        com.day = 1
        if com.month == Date().month {
            com.day = Date().day
        }
        return calendar.date(from: com)!
    }
    
    ///上个月
    public func prevMonth() -> Date {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day, .hour, .minute,.second,.nanosecond], from: self)
        com.month = com.month!-1
//        com.day = 1
//        if com.month == Date().month {
//            com.day = Date().day
//        }
        return calendar.date(from: com)!
    }
    
    
    /// 获取指定时间下一个月的长度
    ///
    /// - Returns: 获取指定时间下一个月的长度
    public func getNextDateLenght() ->Int {
        let date = self.getNextDate()
        return date.getMonthHowManyDay()
    }
    
    /// 获取指定时间上一个月的长度
    ///
    /// - Returns: 获取指定时间上一个月的长度
    public func getLastDateLenght() ->Int {
        let date = self.getLastDate()
        return date.getMonthHowManyDay()
    }
    
    /// 是否是今天
    ///
    /// - Returns: 是否是今天
    public func isToday() -> Bool {
        let calendar = Calendar.current
        /// 获取self的时间
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return (com.year == comNow.year) && (com.month == comNow.month) && (com.day == comNow.day)
    }
    
    
    /// 是否是这个月
    ///
    /// - Parameter date: 是否是这个月
    /// - Returns: 是否是这个月
    public func isEqualMonth(date: Date) -> Bool {
        let calendar = Calendar.current
        var comSelf = calendar.dateComponents([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return (comSelf.year == comNow.year) && (comSelf.month == comNow.month)
    }
    
    /// 是否是这个月
    ///
    /// - Returns: 是否是这个月
    public func isThisMonth() -> Bool {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return (com.year == comNow.year) && (com.month == comNow.month)
    }
    
    /// 获取指定日的date
    ///
    /// - Parameter day: 日
    /// - Returns: 日期
    public func getDate(day :Int)-> Date {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.day], from: self)
        com.day = day
        return calendar.date(from: com)!
    }

    //-3是星期一到星期日 -4是星期日到星期六
    public func dayOfWeek() -> Int {
        let interval = self.timeIntervalSince1970
        let days = Int(interval / 86400)
        return (days-3) % 7
    }
    //homeDay()
    
    /// 周几中文 如周一
    public var weekCN: String {
        get {
            let interval = self.timeIntervalSince1970
            let days = Int(interval / 86400)
            let w = (days-3) % 7
            let weekcn = ["周一","周二","周三","周四","周五","周六","周日"]
            return weekcn[w]
        }
    }
    public var weekEN: String {
        get {
            let interval = self.timeIntervalSince1970
            let days = Int(interval / 86400)
            let w = (days-3) % 7
            let weekcn = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
            return weekcn[w]
        }
    }
    public var weekCronNumber: String {
        get {
            let interval = self.timeIntervalSince1970
            let days = Int(interval / 86400)
            let w = (days-3) % 7
            let weekcn = ["2","3","4","5","6","7","1"]
            return weekcn[w]
        }
    }
    
    /// 获取具体日期 cron表达式
    ///
    /// - Returns: Seconds Minutes Hours DayofMonth Month DayofWeek Year
    public func cronTime() -> String {
        //改成一个里面直接获取
        //let yhmds = self.getOne()
        return "\(self.second) \(self.minute) \(self.hour) \(self.day) \(self.month) \(self.weekCronNumber) \(self.year)"
        //"59 59 23 31 12 7 2016"
    }
    
    
    public func cronWeekTime(cronweeks: String) -> String {
        //Seconds Minutes Hours DayofMonth Month DayofWeek
        return "\(self.second) \(self.minute) \(self.hour) * * \(cronweeks)"
        //return "\(self.second) \(self.minute) \(self.hour) ? * \(cronweeks)"
        ///标准是?* abee服务器要求是** 标准时1-7abee服务器要求是0-6
        //"59 59 23 ? * 2,3,4,5,6" 周一至周五的上午10:15触发
        //1-7的整数或SUN-SAT两个范围
    }
    
    
    /// cron表达式
    ///
    /// - Parameters:
    ///   - time: 时间
    ///   - cronweeks: 周
    /// - Returns: cron
    public func cronWeekTime(time: Date,cronweeks: String) -> String {
        //Seconds Minutes Hours DayofMonth Month DayofWeek
        return "\(time.second) \(time.minute) \(time.hour) ? * \(cronweeks)"
        //"59 59 23 ? * 2,3,4,5,6" 周一至周五的上午10:15触发
        //1-7的整数或SUN-SAT两个范围
    }
    
//    /**
//     算出进入周几 SwiftDate里面有
//     - parameter date: week为整形，从0到6分别表示 周日 到周六
//     - returns: 返回周几 从0到6分别表示 周日 到周六
//     */
//    func dayOfWeek(_ date: Date) -> Int {
//        let interval = date.timeIntervalSince1970//self.timeIntervalSince1970
//        let days = Int(interval / 86400)
//        return (days-3) % 7
//    }
    
    //系统里面已经有这个价格呢

    public func homeDay() -> String {
        let weekString = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        let week: String = weekString[self.dayOfWeek()]
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = " MM月dd日 yyy"
        //"EEEE MM月dd日 yyy"
        //"yyy-MM-dd 'at' HH:mm:ss.SSS"
        let strNowTime = timeFormatter.string(from: self) as String
        return week+strNowTime
    }
    
    //TODO: 方法大写字母开头是自定义
    public func LocalTime() -> Date {
        let timeZone = TimeZone.current
        let seconds = timeZone.secondsFromGMT(for: self)
        let currectDate: Date = self.addingTimeInterval(Double(seconds))
        return currectDate
    }
    
    
    /// GMT时间
    ///
    /// - Returns: GMT时间
    public func GMTTime() -> Date {
        let gmtDate: Date = self//.addingTimeInterval(0)
        return gmtDate
    }
    
    /// 格林威治时间转换为毫秒
    ///
    /// - Returns: 毫秒
    public func GMTmillisecond() -> Int64 {
        let t: TimeInterval = self.timeIntervalSince1970
        //四舍五入法：精确到毫秒
        let millisecond = CLongLong(round(t*1000))
        return millisecond
    }
    
    
    /// GMT时间
    ///
    /// - Returns: GMT时间
    public func GMTMSString() -> String {
        let t: TimeInterval = self.timeIntervalSince1970
        //四舍五入法：精确到毫秒
        let millisecond = CLongLong(round(t*1000))
        return "\(millisecond)"
    }
    
    public func Localmillisecond() -> Int64 {
        let timeZone = TimeZone.current
        let seconds = timeZone.secondsFromGMT(for: self)
        let currectDate: Date = self.addingTimeInterval(Double(seconds))
        
        let t: TimeInterval = currectDate.timeIntervalSince1970
        //四舍五入法：精确到毫秒
        let millisecond = CLongLong(round(t*1000))
        return millisecond
    }
    
//    func greenWichMilliSecond() -> Int64 {
//        //Date().inGMTRegion().day
//        let interval: TimeInterval = self.timeIntervalSince1970
//        //        let timeStamp = Int(timeInterval)
//        //        print("当前时间的时间戳：\(timeStamp)")
//        
//        //        let interval: TimeInterval = Date.timeIntervalSinceReferenceDate
//        //        print("interval毫秒: \(interval)")
//        //        let time = Int(interval)
//        //        print("time秒: \(time)")
//        
//        //四舍五入法：可精确到秒或毫秒
//        //精确到秒let second = Int(round(interval))
//        //精确到毫秒
//        let millisecond = CLongLong(round(interval*1000))
//        return millisecond
//    }
    
    /// 获取年月日时分秒毫秒的字符串
    ///
    /// - Returns: 年月日时分秒毫秒的字符串
    public func YMDHMSN() -> String {
        return "\(self.year)\(self.month)\(self.day)\(self.hour)\(self.minute)\(self.second)\(Int(self.nanosecond/1000000))"
    }
    
    /**
     时间转换成字符串
     - parameter formater: 格式
     - returns: 返回字符串
     */
    public func toString(_ formater: Formater) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = formater.rawValue
        return timeFormatter.string(from: self)
    }
    
    /// 日期加法 需要修改成Calendar自带加法
    ///
    /// - Parameters:
    ///   - component: 日期类型
    ///   - date: 加的数量
    /// - Returns: 新日期
    public func add(_ component: Calendar.Component = .day,_ date: Int) -> Date {
        //TODO: - 日期时间更新
        //两个日期的间隔秒数
        //date1!.timeIntervalSince(date22!)
        
        //比较两个日期的天数
        //let between = userCalendar.dateComponents([.year], from: date1!, to: date22!)
        //between.year
        
//        let userCalendar = Calendar.current
//        //在date1的基础上，增加90天
//        userCalendar.date(byAdding: component, value: date, to: self)
        //userCalendar.date(byAdding: .day, value: 90, to: date1!)
        
//        //在date1基础上，增加日期组件后的date
//        var com = DateComponents()
//        com.hour = 4
//        com.minute = 4
//        userCalendar.date(byAdding: com, to: date1!)
        
        var second: Int = 0
        switch component {
        case .year:
            second = 365*date*24*60*60
        case .month:
            second = 30*date*24*60*60
        case .day:
            second = date*24*60*60
        case .hour:
            second = date*60*60
        case .minute:
            second = date*60
        default:
            //.second
            second = date
        }
        return self.addingTimeInterval(Double(second))
    }
    
    public func DayBefore(_ many: Int) {
//        let secondsPerDay: NSTimeInterval = 24*60*60
        //let date: NSDate = self.addt
        
        //[date1 addTimeInterval:-secondsPerDay];
        
        //NSTimeInterval secondsPerHour = 60*60;
        //NSDate *date6 = [date1 addTimeInterval:-secondsPerHour];//前一小时
    }
}

extension Int64 {
    
    /// 格林威治时时间戳转换为时间
    public func greenWichTime() -> Date {
        let timeInterval: TimeInterval = TimeInterval.init(self)
        //毫秒转为秒
        let date = Date(timeIntervalSince1970: timeInterval/1000)
//        let dformatter = NSDateFormatter()
//        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print("对应的日期时间：\(dformatter.stringFromDate(date))")
        return date
    }
    
    /// 聊天时间
    ///
    /// - Returns: 聊天时间
    public func chatTime() -> String {
        let date = self.greenWichTime()
        if date.day == Date().day {
            return date.toString(.hm)//"\(date.hour):\(date.minute)"
//        }else if 1==2 {
//            return "\(Date().day-date.day)天前"
        }else {
            return date.toString(.ymdWX)
        }
    }
}

extension String {
    public func cronToDate() -> Date {
        //改成一个里面直接获取
        //let yhmds = self.getOne()
        //return "\(self.second) \(self.minute) \(self.hour) \(self.day) \(self.month) \(self.weekCronNumber) \(self.year)"
        //"59 59 23 31 12 7 2016"
        let date = Date()
        return date
    }
    
    
    public func cronToWeekDate() -> (Date,String) {
        //Seconds Minutes Hours DayofMonth Month DayofWeek
        //return "\(self.second) \(self.minute) \(self.hour) ? * \(cronweeks)"
        //"59 59 23 ? * 2,3,4,5,6" 周一至周五的上午10:15触发
        //1-7的整数或SUN-SAT两个范围
        let cronweeks = ""
        let date = Date()
        return (date,cronweeks)
    }
}

extension Date {
    /// 显示在最近聊天里
    public func chatTime() -> String {
        if self.day == Date().day {
            return self.toString(.hm)//"\(date.hour):\(date.minute)"
        }else {
            return "\(Date().day-self.day)天前"
        }
    }
    
    /// 显示在聊天记录里
    public func chatShowTime() -> String {
        if self.day == Date().day {
            return self.toString(.hm)
            //"\(date.hour):\(date.minute)"
        }else {
            switch Date().day-self.day {
            case 1:
                return "昨天 \(self.toString(.hm))"
            case 2:
                return "前天 \(self.toString(.hm))"
            default:
                return self.toString(.YMDhm)//ymdhms
            }
        }
    }
}

/// 枚举NSDateFormatter类型 大写是汉字 //大写HH是24小时制
public enum Formater: String {
    case YMDhm = "yyyy年MM月dd日 HH:mm"
    case ymdhms = "yyyy-MM-dd HH:mm:ss"
    case MDhms = "MM月dd日 HH:mm:ss"
    case ymd = "yyyy-MM-dd"
    case y = "yyy"
    case hm = "HH:mm"
    case M = "MM月"
    case MD = "MM月dd日"
    case md = "MM-dd"
    case ymdWX = "yyyy/MM/dd"
    
    case PushTime = "yyyy-MM-dd_HH:mm:ss"
}
