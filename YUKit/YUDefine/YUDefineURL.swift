
//
//  YUDefineURL.swift
//  PowerCC
//
//  Created by chenliangyu on 16/5/9.
//  Copyright © 2016年 Whale. All rights reserved.
//

import Foundation
import UIKit

/// 使用自己的地址
public let APIURL = "http://appforintel.intel.com.cn/intel/"

public let PUSHMESSAGE = APIURL+"zhct/order!noticeQuery.do"

class API{
    class func Order(_ name: String) -> String{
        return APIURL+"zhct/order!\(name).do"
    }
    
    class func Image(_ name: String) -> String{
        return APIURL+"public/images/upload/\(name)/"
    }
    
    static public let GGIMAGE = API.Image("guangao")
    static public let DKIMAGE = API.Image("dangkou")
    static public let MSHDIMAGE = API.Image("mshd")
    static public let MENUIMAGE = API.Image("zhct")
}

//public let asd = APIUrl.Order("sd")
public let GUANGGAO = APIURL+"zhct/order!getWapImgs.do?filedir=guangao"
public let WIFISSIDURL = "http://192.168.31.1:8080/WifiSet/12345"

//现场支付8个档口
public let XCPAY = APIURL+"zhct/order!xczfdangkouQuery.do"

//public let YLPAY = APIURL+"zhct/order!test.do"

//登录地址
public let LOGINURL = APIURL+"query/jgcx/mac!loginforzhct.do"
public let REGISTURL = APIURL+"query/jgcx/mac!registforzhct.do"
public let CHANGEPWDURL = APIURL+"query/jgcx/mac!resetPwdByName.do"

public let ORDERLIST = APIURL+"zhct/order!orderQuery.do"
public let ORDERDETAIL = APIURL+"zhct/order!orderDetailQuery.do"

public let GETPAIDUI = APIURL+"zhct/order!getWaitNum.do"

public let ADDPUSH = APIURL+"zhct/order!pushAlert.do"

public let GETDANGKOU = APIURL+"zhct/order!dangkouQuery.do"

///提交订单
public let ADDORDER = APIURL+"zhct/order!insOrder.do"

public let ORDERJIAMI = APIURL+"zhct/order!getEnPay.do"
public let MOBILEPAYJM = APIURL+"zhct/order!getEnPay.do"
public let MOBILEWXPAYJM = APIURL+"zhct/order!getEnWXPay.do"

/// 是否转账
public let ISZZ = APIURL+"zhct/order!enableAcc.do"


/// 支付宝回调
public let PAYORDERBACK = APIURL+"zhct/order!ZFBhuidiao.do"

/// 转账回调
public let PAYZZBACK = APIURL+"zhct/order!insAccount.do"
/// 现场支付回调
public let PAYHEREBACK = APIURL+"zhct/order!locusPay.do"

/// 连连支付订单回调
public let LLPAYORDERBACK = APIURL+"zhct/order!ZFBhuidiaoyt.do"
/// 连连支付转账回调
public let LLPAYZZBACK = APIURL+"zhct/order!insAccountyt.do"
/// 连连支付现场支付回调
public let LLPAYHEREBACK = APIURL+"zhct/order!locusPayyt.do"

/// 今日营业额
public let JRYYE = APIURL+"zhct/order!getTodayIncome.do"


public let GETTIME = APIURL+"zhct/order!dangkouTimeQuery.do"
public let CHANGETIME = APIURL+"zhct/order!updWorkTime.do"


public let MSHD = APIURL+"zhct/order!getWapImgs.do?filedir=mshd"

public let DCTJ = APIURL+"zhct/order!menuQuery.do"



public let ADDDEVICE = APIURL+"mobilePortal/control/control!addDevice.do"
public let DELDEVICE = APIURL+"mobilePortal/control/control!delDevice.do"
/// 参加需求响应
public let GETDEVICE = APIURL+"mobilePortal/control/control!setDrMode.do"
//public let ADDDEVICE = "http://192.168.1.112/guangzhou/mobilePortal/control/control!addDevice.do"

public let RESETPWDURL = APIURL+"query/jgcx/mac!resetPwd.do"

public let GETDAYHOUR = APIURL+"mobilePortal/query/query!queryTotalQuantity.do"
public let GETROOM = APIURL+"mobilePortal/query/query!queryRooms.do"

/// 空气质量
public let LAJICOMPPM = APIURL+"mobilePortal/query/query!queryAirDataByRoomId.do"

/// 按日期区间查询用电量
public let QUERYREGION = APIURL+"mobilePortal/query/query!queryTotalQuantity.do"

/// 按日期查询用电量
public let QUERYDAY = APIURL+"mobilePortal/query/query!queryTotalQuantity.do"

public let QUERYHISTORY = APIURL+"mobilePortal/query/query!queryQuantityHisData.do"

///根据用户名查询task
public let QUERYTASK = APIURL+"mobilePortal/control/control!getCommandList.do"

public let GROUPTASK = APIURL+"mobilePortal/control/control!executeCommand.do"

///查询温度电压能数据
public let GETTEMP = APIURL+"mobilePortal/query/query!queryRunningParameters.do"
