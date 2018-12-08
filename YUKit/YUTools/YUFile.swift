//
//
//  Created by 中良 on 2016/8/4.
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
//  YUFile.swift
//  PowerCC
//

import UIKit

//NSFileManager文件管理器主要是对文件进行操作（创建、删除、改名等）以及文件信息的获取
//NSFileHandle文件连接器主要是对文件内容进行读取与写入操作

open class YUFile: NSObject {

    ///头像文件路径
    public static var headPhotoPath: String! {
        get {
            return self.getPath() + "HeadPhoto.png"
            //stringByAppendingPathComponent()
        }
    }
    
    public static var headPhoto: String! {
        get {
            return "HeadPhoto.png"
        }
    }
//    static func pngTimePath() -> String {
//        return self.getPath() + "/\(Date().intSF()).png"
//    }
    
    //这个方法可以合并
    public static func pngTime() -> String {
        return "\(Date().intSF()).png"
    }
    
    public static func voiceTime() -> String {
        return "\(Date().intSF()).aac"
    }
    
    //获取Document目录 格式aac
    public static func appendAAC(_ name: String) -> String{
        //组合录音文件路径
        return self.getPath() + "\(name).aac"
        //        return documentPath + "/\(name)"
    }
    
    /// 获取沙盒地址
    ///
    /// - Returns: path+/
    public static func getPath() -> String{
        //获取Documents文件夹目录
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        //var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        let documentPath = path[0] + "/"
        return documentPath
    }
    
    public static func pathWithName(_ name: String) -> String {
        let filePath: String = self.getPath().appendingFormat(name)
        //YUPrint("数据库目录 = \(filePath)")
        return filePath
    }
    
    
    /// 统计缓存文件大小
    ///
    /// - Returns: 文件大小
    public static func fileSizeOfCache()-> Int {
        
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        //缓存目录路径
        YUPrint(cachePath!)
        
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        //快速枚举出所有文件名 计算文件大小
        var size = 0
        for file in fileArr! {
            // 把文件名拼接到路径中
            let path = cachePath!+"/\(file)"
                //cachePath?.stringByAppendingString("/\(file)")
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            // 用元组取出文件大小属性
            for (abc, bcd) in floder {
                // 累加文件大小
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).integerValue
                }
            }
        }
        
        let mm = size / 1024 / 1024
        
        return mm
    }
    
    
    /// 删除缓存文件
    public func clearCache() {
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        // 遍历删除
        for file in fileArr! {
            let path = cachePath!+"/\(file)"
//            let path = cachePath?.stringByAppendingString("/\(file)")
            if FileManager.default.fileExists(atPath: path) {
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch {
                    
                }
            }
        }
    }
    
    
    //MARK: 文件路径
    /// documentDirectory
    public class var documentUrl: URL {
        get {
            //1)获取路径
            //使用NSSearchPathForDirectoriesInDomains或URLsForDirectory
            //使用NSHomeDirectory➕相应的路径)
            //FileManager.SearchPathDomainMask.allDomainsMask是所有用户的
            //userDomainMask是当前用户的 都用这个
            
            //Document：一般需要持久的数据都放在此目录中，可以在当中添加子文件夹，iTunes备份和恢复的时候，会包括此目录
            //Document获取方式1
            //let home = NSHomeDirectory()
            //NSHomeDirectory() + "/Documents/RookieString.txt"
            
            //Document获取方式2
            //let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            
            // NSSearchPathDirectory.DocumentDirectory 查找Documents文件夹
            // NSSearchPathDomainMask.UserDomainMask 在用户的应用程序下查找
            
            //Document获取方式3
            let manager = FileManager.default
            let urlsForDocDirectory = manager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
            let docPath = urlsForDocDirectory[0]
            return docPath
        }
    }
    
    /// documentDirectory
    public class var documentPath: String {
        get {
            return self.documentUrl.path
        }
    }
    
    /// temp 创建临时文件的目录，当iOS设备重启时，文件会被自动清除
    public class var tempPath: String {
        get {
            let temp = NSTemporaryDirectory()
            return temp
        }
    }
    
    
    ///Library 设置程序的默认设置和其他状态信息:
    public class var libraryPath: String {
        get {
            let library = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
            return library
        }
    }
    
    
    /// 获取Library/Caches目录
    public class var cachePath: String {
        get {
            let cache = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
            return cache
        }
    }
    
    
    /// 获取Library/Preferences目录 通常情况下，Preferences由系统维护，我们很少去操作TA
    public class var prePath: String {
        get {
            let prePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.preferencePanesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
            return prePath
        }
    }
    
    
    // 获取应用程序包的路径 该路径是只读的
    public class var appPath: String {
        get {
            let path = Bundle.main.resourcePath!
            //获取安装包内数据库路径
            //Bundle.main.path(forResource: "db", ofType: "sqlite")
            return path
        }
    }
    
    
    /// documentDirectory的url添加一个字文件夹 只能一层目录
    ///
    /// - Returns: 返回file协议的documentDirectory的url
    public class func appendDocPathurl(filefolder: String) -> URL{
        let docPath = YUFile.documentUrl
        return docPath.appendingPathComponent(filefolder)
    }
    
    /// documentDirectory的url 只能一层目录
    ///
    /// - Returns: 返回documentDirectory的String路径
    public class func appendDocPath(filefolder: String) -> String{
        return self.appendDocPathurl(filefolder: filefolder).path
    }
    
    public class func appendDocument(_ filefolder: String) -> String{
        return self.appendDocPathurl(filefolder: filefolder).path
    }
    
    //MARK: 文件管理
    /// 文件是否已经存在
    ///
    /// - Parameter isFilePath: 文件路径
    /// - Returns: 是否存在
    public class func isExist(_ isFilePath: String) -> Bool {
        let manager = FileManager.default
        let exist = manager.fileExists(atPath: isFilePath)
        return exist
    }
    
    /// 比较两个文件是否内容相同（也可以比较目录）
    ///
    /// - Parameters:
    ///   - path1: path1
    ///   - path2: path2
    /// - Returns: 是否相同
    public class func compare(_ path1: String, _ path2: String) -> Bool {
        let manager = FileManager.default
        //        let docPath = YUFile.documentUrl
        //        let contents = try! manager.contentsOfDirectory(atPath: docPath.path)
        //        print(contents)
        //        let count = contents.count
        //        if count > 1 {
        //            let path1 = docPath.path + "/" + (contents[2] as String)
        //            let path2 = docPath.path + "/" + (contents[1] as String)
        //            let equal = manager.contentsEqual(atPath: path1, andPath: path2)
        //            print("比较结果: \(equal)")
        //        }
        if self.isExist(path1) && self.isExist(path2) {
            let equal = manager.contentsEqual(atPath: path1, andPath: path2)
            return equal
        }else {
            return false
        }
    }
    
    /// 文件权限判断
    ///
    /// - Parameter filepath: filepath
    /// - Returns: 元祖(read,write,execut,delete)
    public class func canRWED(_ filepath: String) -> (Bool,Bool,Bool,Bool) {
        if self.isExist(filepath) {
            let manager = FileManager.default
            let readable = manager.isReadableFile(atPath: filepath)
            print("可读: \(readable)")
            let writeable = manager.isWritableFile(atPath: filepath)
            print("可写: \(writeable)")
            let executable = manager.isExecutableFile(atPath: filepath)
            print("可执行: \(executable)")
            let deleteable = manager.isDeletableFile(atPath: filepath)
            print("可删除: \(deleteable)")
            return (readable,writeable,executable,deleteable)
        }else {
            return (false,false,false,false)
        }
        
    }
    
    //法我们创建的文件格式是file:// 开头的 其实就是URL是file协议
    
    /// 创建文件夹
    ///
    /// - Parameters:
    ///   - name: 文件夹名
    ///   - baseUrl: 文件夹url
    public class func createFolder(name: String,baseUrl: URL){
        let manager = FileManager.default
        let RookieSon = baseUrl.appendingPathComponent(name, isDirectory: true)
        /// 检查文件是否存在
        let exist = manager.fileExists(atPath: RookieSon.path)
        if !exist {
            try! manager.createDirectory(at: RookieSon, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    //TODO: 做一个创建文件夹下文件的同类
    
    /// Document下载创建文件夹
    ///
    /// - Parameter name: 文件夹名
    public class func createDocumentFolder(name: String){
        let manager = FileManager.default
        let url = YUFile.documentUrl
        let RookieSon = url.appendingPathComponent(name, isDirectory: true)
        /// 检查文件是否存在
        let exist = manager.fileExists(atPath: RookieSon.path)
        if !exist {
            try! manager.createDirectory(at: RookieSon, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    /// 创建文件夹
    ///
    /// - Parameter path: 类似 "/Documents/Rookies/Files"
    public class func createDocument(_ path: String) {
        let myDire: String = NSHomeDirectory() + path
        let fileManager = FileManager.default
        try! fileManager.createDirectory(atPath: myDire, withIntermediateDirectories: true, attributes: nil)
    }
    
    public class func copy(from: String,to: String) {
        let manager = FileManager.default
        //6. 对文件进行复制
        //1).第一种方法:
        //let homeDirectory = NSHomeDirectory()
        //let from = homeDirectory + "/Documents/RookieString.txt"
        //let to = homeDirectory + "/Documents/copyed12.txt"
        try! manager.copyItem(atPath: from, toPath: to)
        
        //2).定位到用户文档目录:
        //        let copyUrlForDocument = manager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        //        let copyUrl = copyUrlForDocument[0]
        //        // 将test.txt文件拷贝到文档目录根目录下的copyed.txt文件
        //        let fromUrl2 = copyUrl.appendingPathComponent("/Documents/RookieString.txt")
        //        let toUrl2 = copyUrl.appendingPathComponent("/copyed.txt")
        //        try! manager.copyItem(at: fromUrl2, to: toUrl2)
    }
    
    public class func move(from: String,to: String) {
        let manager = FileManager.default
        //7. 移动文件夹
        //1).第一种方法:
        //let moveHomeDirectory = NSHomeDirectory()
        //let moveFromUrl = moveHomeDirectory + "/Documents/hangge.txt"
        //let moveToUrl = moveHomeDirectory + "/Documents/moved"
        try! manager.moveItem(atPath: from, toPath: to)
        
        //        //2).定位到用户文档目录:
        //        let moveHomeDirectory2 = manager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        //
        //        let moveUrl = moveHomeDirectory2[0]
        //        let moveFromUrl2 = moveUrl.appendingPathComponent("test.txt")
        //        let moveToUrl2 = moveUrl.appendingPathComponent("copyed.txt")
        //        // 移动srcUrl中的文件（test.txt）到toUrl中（copyed.txt）
        //        try! manager.moveItem(at: moveFromUrl2, to: moveToUrl2)
    }
    
    /// 删除文件
    ///
    /// - Parameter filePath: filePath
    public class func deleteFile(_ filePath: String) {
        let manager = FileManager.default
        //let moveUrl = YUFile.documentUrl
        //1).第一种方法:
        //let filePath = NSHomeDirectory() + "/Documents/hangge.txt"
        try! manager.removeItem(atPath: filePath)
        
        //        //2).定位到用户文档目录:
        //        let DelecttoUrl = moveUrl.appendingPathComponent("copyed.txt")
        //        // 删除文档根目录下的toUrl路径的文件（copyed.txt文件）
        //        try! manager.removeItem(at: DelecttoUrl)
    }
    
    //删除目录下所有的文件
    public class func deleteAllFile(_ path: String) {
        let manager = FileManager.default
        // 方法1：获取所有文件，然后遍历删除
        //let DelectAllmyDirectory = NSHomeDirectory() + "/Documents/Files"
        let DelectAllfileArray = manager.subpaths(atPath: path)
        for fn in DelectAllfileArray!{
            try! manager.removeItem(atPath: path + "/\(fn)")
        }
        //        // 方法2：删除目录后重新创建该目录
        //        let DelectAllmyDirectory2 = NSHomeDirectory() + "/Documents/Files"
        //        try! manager.removeItem(atPath: DelectAllmyDirectory2)
        //        try! manager.createDirectory(atPath: DelectAllmyDirectory2, withIntermediateDirectories: true, attributes: nil)
    }
    
    /// 创建文件
    ///
    /// - Parameters:
    ///   - filepath: 文件路径
    ///   - data: 文件内容
    /// - Returns: 文件路径
    public class func createFile(filepath: String, data: Data?) -> String{
        let manager = FileManager.default
        let exist = manager.fileExists(atPath: filepath)
        if !exist {
            //let data = Data(base64Encoded: "aGVsbG8gd29ybGQ=", options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            let createFilesSuccess = manager.createFile(atPath: filepath, contents: data, attributes: nil)
            print("文件创建结果: \(createFilesSuccess)")
        }
        return "\(filepath)"
    }
    
    //MARK: 遍历还在做
    public func getall(url: URL) {
        let manager = FileManager.default
        //了解一个具体目录下的所有文件
        //1).对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        
        let contentsOfPath = try? manager.contentsOfDirectory(atPath: url.path)
        print("contentsOfPath: \(String(describing: contentsOfPath))")
        
        //2).类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        let contentsOfURL = try? manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
        print(contentsOfURL!)
        
        //3).深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtPath = manager.enumerator(atPath: url.path)
        print(enumeratorAtPath!)
        
        //4).类似上面的，深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtURL = manager.enumerator(at: url, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles, errorHandler: nil)
        print(enumeratorAtURL!)
        
        //5).深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath
        let subPaths = manager.subpaths(atPath: url.path)
        print(subPaths!)
    }
    
    //YUUD.setImagesViewData(newsImageView: ImgView, imageString: URL)
    /// 传递一个uiimageView，和图片路径，设置图片，异步操作
    ///
    /// - Parameters:
    ///   - newsImageView: UIImageView
    ///   - imageString: 网络图片地址
    public class func setImagesViewData(newsImageView: UIImageView,imageString: String) {
        //        // 获取文件路径
        //        var catePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        //        print(catePath)
        //        let cateImagesUrl = URL(fileURLWithPath: "\(catePath.first)/\("imageString.Rookie_MD5()")")//获取缓存加密后的路径
        //
        //        //缓存存在直接加载
        //        if let cateReadData = try! Data(contentsOf: cateImagesUrl) {
        //            newsImageView.image = UIImage(data: cateReadData)
        //        }
        //        else{
        //            newsImageView.image = UIImage(named: "load.jpg")//默认图片
        //            //这里我们做个异步处理,用来加载图片
        //            let session = URLSession.shared
        //            let task = session.dataTask(with: URL.init(string: imageString)!, completionHandler: { (imageData, response, error) in
        //                if let error = error {
        //                    print("连接网络失败1:\\(error)");
        //                }else{
        //                    // 当我们加载完数据了回主线程修改图片
        //                    if let endImageData = imageData{
        //                        DispatchQueue.main.sync {
        //                            newsImageView.image = UIImage(data: endImageData)
        //                        }
        //                        // 写入本地
        //                        endImageData.write(to: cateImagesUrl, options: Data.WritingOptions.atomic)
        //                    }
        //                }
        //            })
        //            // 启动任务
        //            task.resume()
        //        }
    }
    
//    class func testSave() {
//        //存储plist属性列表
//        let url = YUFile.documentUrl
//        let fileName = "RookieSon.plist"
//        // 创建文件
//        let filesPath = YUFile.creatNewFiles(name: fileName, fileBaseUrl: url)
//        // 储存数据
//        let saveDataInfo: NSArray = ["我的剑,就是你的剑","我用双手成就你的梦想","纵然前路迷茫，纵然天隔一方，纵然我手中的刀刃已然破碎，也无法阻挡我寻找你的道路"]
//        print(saveDataInfo)
//        // 写入文件
//        saveDataInfo.write(toFile: filesPath, atomically: true)
//        //saveDataInfo.writeToURL(NSURL(string: filesPath)!, atomically: true)
//        // 读取文件
//        let readDataInfo = YUFile.readTheFlies(name: fileName, fileBaseUrl: url)
//        print(readDataInfo)
//
//
//        //4. 将对象写入指定文件中
//        //public func writeToFile(path: String, atomically useAuxiliaryFile: Bool, encoding enc: NSStringEncoding) throws
//        //public func writeToFile(path: String, atomically useAuxiliaryFile: Bool) -> Bool
//
//        let txtPath = YUFile.appendDocPath(filefolder: "objc.txt")
//        let string = "Objective-C"
//        //[manager createFileAtPath:filePath contents:[@"Objective-C" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
//        try! string.write(toFile: txtPath, atomically: true, encoding: String.Encoding.utf8)
//        print("String存储文件位置 : \(txtPath)")
//
//        let resultStr = try? String.init(contentsOfFile: txtPath, encoding: String.Encoding.utf8)
//        print(resultStr)
//
//        let filePath = YUFile.appendDocPath(filefolder: "arr.plist")
//        let array: NSArray = ["C语言","JAVA","Objective-C","Swift","PHP","C++","C#"]
//        array.write(toFile: filePath, atomically: true)
//        print("filePath is \(filePath)")
//        let resultArr: NSArray = NSArray(contentsOfFile: filePath)!
//        print(resultArr[1])
//
//
//        let fileDicPath = YUFile.appendDocPath(filefolder: "love.txt")
//        let dic: NSDictionary = ["职业": "程序员","梦想": "代码无BUG"]
//        dic.write(toFile: fileDicPath, atomically: true)
//        let resultDic: NSDictionary = NSDictionary(contentsOfFile: fileDicPath)!
//        print(resultDic["梦想"])
//
//        let imageurl = YUFile.appendDocPathurl(filefolder: "String.png")
//        let image = UIImage(named: "dl")
//        let imageData: Data = UIImagePNGRepresentation(image!)!
//        //UIImageJPEGRepresentation(image!, 0)
//        try? imageData.write(to: imageurl, options: Data.WritingOptions.atomic)
//
//        // 从文件读取存储的NSData数据
//        //        let resultData = try? Data.init(contentsOf: imageurl)
//        //        let resultImage: UIImage = UIImage.init(data: resultData!)!
//        //        let imageView = UIImageView(frame: self.view.bounds)
//        //        imageView.image = resultImage
//        //        self.view.addSubview(imageView)
//    }
    
    
    /// 读取我们所建的文
    ///
    /// - Parameter filePath: 文件路径String
    /// - Returns: 文本内容
    public class func readTXT(_ filePath: String) -> String{
        //方法1 还可以用URL 不用string的path
        let readHandler = FileHandle(forReadingAtPath: filePath)
        //如果文件路径不存在
        if readHandler == nil {
            return ""//nil
        }else {
            let data = readHandler?.readDataToEndOfFile()
            let readString = String(data: data!, encoding: String.Encoding.utf8)
            //如果传入的路径 类型不是文本
            if readString == nil {
                return ""
            }else {
                return readString!
            }
        }
        //方法2
        //let manager = FileManager.default
        //let data = manager.contents(atPath: file.path)
    }
    
    /// 读取文件
    ///
    /// - Parameter fileurl: fileurl
    /// - Returns: 可能为空
    public class func readFlies(fileurl: URL) -> Data?{
        if self.isExist(fileurl.path) {
            let readHandler = try! FileHandle(forReadingFrom: fileurl)
            let data = readHandler.readDataToEndOfFile()
            return data
        }else {
            return nil
        }
    }
    
}

extension String {
    /// 添加一些文字到文件末尾
    ///
    /// - Parameter fileUrl: 文件URL
    /// - Returns: 是否成功 图片等也可以但是是错误的
    public func appendTXT(_ fileUrl: URL) -> Bool{
        let writeHandler = try? FileHandle(forWritingTo: fileUrl)
        if writeHandler == nil {
            return false
        }else {
            //如果是图片 追加就异常
            writeHandler!.seekToEndOfFile()
            let appendedData = self.data(using: String.Encoding.utf8, allowLossyConversion: true)
            writeHandler!.write(appendedData!)
            return true
        }
    }
    
    /// 从文件偏移量为offset那个位置开始追加内容append
    ///
    /// - Parameters:
    ///   - filepath: 原文件位置
    ///   - offset: 偏移量
    ///   - append: 追加内容
    public func appendFile(filepath: String,offset: UInt64) {
        // 创建文件对接对象
        let handle = FileHandle(forUpdatingAtPath: filepath)// 文件对接对象此时针对文件既可以读取又可以写入
        // 将偏移量挪到3的位置
        handle?.seek(toFileOffset: offset)
        // 写入数据
        handle?.write(self.data(using: String.Encoding.utf8)!)
        // 执行完操作之后不要忘记关闭文件
        handle?.closeFile()
    }
    
    
    // 对象方法
    
    /// 获取文件 文件夹大小 bytes
    ///
    /// - Returns: 返回文件 或者文件夹大小字节
    public func getFileSize() -> UInt64 {
        //获取某个文件或者某个文件夹的大小
        //获取文件属性（创建时间，修改时间，文件大小，文件类型等信息)
        //if filemanager.fileExistsAtPath(path){
        //var fileinfo = try? manager.attributesOfItem(atPath: docPath.path)
        var size: UInt64 = 0
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        let isExists = fileManager.fileExists(atPath: self, isDirectory: &isDir)
        // 判断文件存在
        if isExists {
            // 是否为文件夹
            if isDir.boolValue {
                // 迭代器 存放文件夹下的所有文件名
                let enumerator = fileManager.enumerator(atPath: self)
                for subPath in enumerator! {
                    // 获得全路径
                    let fullPath = self.appending("/\(subPath)")
                    do {
                        let attr = try fileManager.attributesOfItem(atPath: fullPath)
                        size += attr[FileAttributeKey.size] as! UInt64
                    } catch  {
                        print("error :\(error)")
                    }
                }
            } else {    // 单文件
                do {
                    let attr = try fileManager.attributesOfItem(atPath: self)
                    size += attr[FileAttributeKey.size] as! UInt64
                } catch  {
                    print("error :\(error)")
                }
            }
        }
        return size
    }
}

//class Person: NSObject,NSCoding {
//
//    //NSKeyedArchiver
//    //采用归档的形式来保存数据，该数据对象需要遵守NSCoding协议，并且该对象对应的类必须提供encodeWithCoder:和initWithCoder:方法。前一个方法告诉系统怎么对对象进行编码，而后一个方法则是告诉系统怎么对对象进行解码。例如对Possession对象归档保存。
//
//    //归档操作：
//    //如果对Possession对象allPossession归档保存，只需要NSCoder子类NSKeyedArchiver的方法archiveRootObject:toFile: 即可。
//    //NSString *path = [self possessionArchivePath];
//    //[NSKeyedArchiver archiveRootObject:allPossessions toFile: path ]
//
//    //解压操作：
//    //同样调用NSCoder子类NSKeyedArchiver的方法unarchiveRootObject:toFile: 即可
//    //allPossessions = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] retain];
//
//    //缺点：归档的形式来保存数据，只能一次性归档保存以及一次性解压。所以只能针对小量数据，而且对数据操作比较笨拙，即如果想改动数据的某一小部分，还是需要解压整个数据或者归档整个数据。
//
//    func archiveSaveDataInfo(){
//        // 储存自定义对象
//        let userDefault = UserDefaults.standard
//        let mo = Person(name: "RookieYX", phone: "123456")
//        // 实例对象转化成Data
//        let moData: Data = NSKeyedArchiver.archivedData(withRootObject: mo)
//        // 储存Data对象
//        userDefault.set(moData, forKey: "myMo")
//
//        // 自定义对象读取
//        let myMoData = userDefault.object(forKey: "myMo") as! Data
//        // 解档
//        let myM = NSKeyedUnarchiver.unarchiveObject(with: myMoData) as! Person
//        print(myM.name!)
//    }
//
//
//    var name: String?
//    var phone: String?
//
//    // 构造方法
//    init(name: String!,phone: String!) {
//        self.name = name
//        self.phone = phone
//
//        super.init()
//    }
//
//    // 从NSObject解析回来
//    required init?(coder aDecoder: NSCoder) {
//        self.name=aDecoder.decodeObject(forKey: "name") as? String
//        self.phone=aDecoder.decodeObject(forKey: "phone") as? String
//    }
//    //编码成object,哪些属性需要归档，怎么归档
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(phone, forKey:"phone")
//    }
//}
