////
////
////  Created by 中良 on 2016/6/28.
////  Copyright © 2016年 Whale. All rights reserved.
////
////                          _oo0oo_
////                         088888880
////                         88" . "88
////                         (| -_- |)
////                          0\ = /0
////                       ___/'---'\___
////                     .' \\|     |// '.
////                    / \\|||  :  |||// \
////                   /_ ||||| -:- |||||- \
////                  |   | \\\  -  /// |   |
////                  | \_|  ''\---/''  |_/ |
////                  \  .-\__  '-'  __/-.  /
////                ___'. .'  /--.--\  '. .'___
////             ."" '<  '.___\_<|>_/___.' >'  "".
////            | | : '-  \'.;'\ _ /';.'/ - ' : | |
////            \  \ '_.   \_ __\ /__ _/   .-' /  /
////        ====='-.____'.___ \_____/___.-'____.-'=====
////                          '=---='
////
////            微信号:ioschen
////            博客地址:http://ioschen.com
////
////  YULaunchAdMonitor.swift
////  PowerCC
////
//
//import UIKit
//import QuartzCore
//
//enum YULaunchAdProcess: Int {
//    case YULaunchAdProcessFailed
//    case YULaunchAdProcessNone
//    case YULaunchAdProcessLoading
//    case YULaunchAdProcessSuccess
//}
//var YULaunchAdDetailDisplayNotification = "YUShowLaunchAdDetailNotification"
//var monitor: YULaunchAdMonitor!
//
//class YULaunchAdMonitor: NSObject,NSURLConnectionDataDelegate,NSURLConnectionDelegate {
//    //@property (nonatomic, assign) BOOL imgLoaded;
//    var process: YULaunchAdProcess!
//    var imgData: NSMutableData!
//    var conn: NSURLConnection!
//    var detailParam: NSMutableDictionary!
//    
//    class func showAdAtPath(path: String,container: UIView,timeInterval: NSTimeInterval,detailParameters: NSDictionary){
//        
//        + (BOOL)validatePath:(NSString *)path{
//            NSURL *url = [NSURL URLWithString:path];
//            return url != nil;
//        }
//        
//        if (![self validatePath:path]) {
//            return ;
//        }
//        [[self defaultMonitor] loadImageAtPath:path];
//        while ((monitor.process != YULaunchAdProcessFailed) && (monitor.process != YULaunchAdProcessSuccess) ) {
//            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                beforeDate:[NSDate distantFuture]];
//        }
//        [monitor.detailParam removeAllObjects];
//        [monitor.detailParam addEntriesFromDictionary:param];
//        if (monitor.process == YULaunchAdProcessFailed) {
//            return ;
//        }
//        [self showImageOnView:container forTime:interval];
//        
//    }
//    
//    
//    + (instancetype)defaultMonitor
//        {
//            @synchronized (self) {
//                if (!monitor) {
//                    monitor = [[YULaunchAdMonitor alloc] init];
//                    monitor.detailParam = [NSMutableDictionary dictionary];
//                }
//                return monitor;
//            }
//        }
//    
//    func loadImageAtPath(path: String) {
//        let url = NSURL(string: path)
//        var request = NSURLRequest(URL: url!)
//        request = NSURLRequest(URL: url!, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 10)
//        
//        self.conn = NSURLConnection(request: request, delegate: self)
//        if (self.conn != nil) {
//            self.process = YULaunchAdProcess.YULaunchAdProcessLoading
//            self.conn.start()
//        }
//    }
//    
//    class func showImageOnView(container: UIView,time: NSTimeInterval){
//        var f = UIScreen.mainScreen().bounds
//        var v = UIView(frame: f)
//        v.backgroundColor = UIColor.whiteColor()
//        
//        f.size.height -= 50
//        var iv = UIImageView(frame: f)
//        iv.image = UIImage(data: monitor.imgData)
//        monitor.conn = nil
//        monitor.imgData.length = 0
//        iv.contentMode = .ScaleAspectFill
//        iv.clipsToBounds = true
//        v.addSubview(iv)
//        
//        container.addSubview(v)
//        container.bringSubviewToFront(v)
//        
//        var showDetailBtn = UIButton(type: .Custom)
//        showDetailBtn.s
//        [showDetailBtn setTitle:@"详情>>" forState:UIControlStateNormal];
//        [showDetailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [showDetailBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        showDetailBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//        showDetailBtn.frame = CGRectMake(f.size.width - 70, 30, 60, 30);
//        showDetailBtn.layer.borderColor = [UIColor whiteColor].CGColor;
//        showDetailBtn.layer.borderWidth = 1.0f;
//        showDetailBtn.layer.cornerRadius = 3.0f;
//        [showDetailBtn addTarget:self action:@selector(showAdDetail:) forControlEvents:UIControlEventTouchUpInside];
//        [v addSubview:showDetailBtn];
//        
//        var label = [[UILabel alloc] initWithFrame:CGRectMake(10, f.size.height + 10, f.size.width - 20, 30)];
//        label.backgroundColor = [UIColor clearColor];
//        label.text = @"©2015 iXcoder. All Rights Reserved";
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:15];
//        [v addSubview:label];
//        label = nil;
//        
//        [container addSubview:v];
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time*NSEC_PER_SEC), dispatch_get_main_queue, { 
//            v.userInteractionEnabled = false
//            UIView.animateWithDuration(0.25, animations: { 
//                v.alpha = 0.0
//                }, completion: { (finished) in
//                    v.removeFromSuperview()
//            })
//        })
//    }
//    
//    class func showAdDetail(sender: UIButton) {
////        let sup: UIView = (UIButton)sender.superview
////        sup.userInteractionEnabled = NO;
//        sender.userInteractionEnabled = false
//        UIView.animateWithDuration(0.25, animations: { 
//            sender.alpha = 0.0
//            }) { (finished) in
//                sender.removeFromSuperview()
//                NSNotificationCenter.defaultCenter().postNotificationName(YULaunchAdDetailDisplayNotification, object: monitor.detailParam)
//                monitor.detailParam.removeAllObjects()
//        }
//    }
//    
//
//    //pragma mark - NSURLConnectionDataDelegate method
//    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
//        let resp: NSHTTPURLResponse = response as! NSHTTPURLResponse
//        if (resp.statusCode != 200) {
//            //self.imgLoaded = YES;
//            self.process = YULaunchAdProcess.YULaunchAdProcessFailed;
//            return ;
//        }
//        self.imgData = NSMutableData()
//    }
//    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
//        self.imgData.appendData(data)
//    }
//    func connectionDidFinishLoading(connection: NSURLConnection) {
//        //self.imgLoaded = YES;
//        self.process = YULaunchAdProcess.YULaunchAdProcessSuccess
//    }
//    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
//        print("图片数据获取失败")
//        //self.imgLoaded = YES;
//        self.process = YULaunchAdProcess.YULaunchAdProcessFailed
//    }
//}
