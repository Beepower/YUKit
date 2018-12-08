//
//  YURecordTool.swift
//  X
//
//  Created by chen on 2017/6/28.
//  Copyright © 2017年 chen. All rights reserved.
//

import UIKit
import AVFoundation

public protocol YURecordToolDelegate {
    func recordTool(recordTool: YURecordTool,didstartRecoring: Int)
    func recordToolDidFinishPlay(recordTool: YURecordTool)
}

let YURecordFielName  = "yuRecord.wav"
open class YURecordTool: NSObject,AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    /** 播放器对象 */
    var player: AVAudioPlayer!
    /** 更新图片的代理 */
    var delegate: YURecordToolDelegate?
    /** 录音文件地址 */
    var recordFileUrl: URL!
    /** 定时器 */
    var timer: Timer!
    var session: AVAudioSession!
    
    var recorder: AVAudioRecorder!
//    /** 录音对象 */
//    lazy var recorder: AVAudioRecorder! = {
//        // 1.获取沙盒地址
//        let filePath = YUFile.getPath().appending(YURecordFielName)
//        //let filePath = NSHomeDirectory().appending("/tmp/test")
//        self.recordFileUrl = URL.init(fileURLWithPath: filePath)
//        YUPrint(filePath)
//        
//        var setting: Dictionary<String,Any> = Dictionary.init()
//        // 音频格式
//        setting[AVFormatIDKey] = NSNumber.init(value: kAudioFormatMPEG4AAC) //kAudioFormatLinearPCM
//        // 录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
//        setting[AVSampleRateKey] = 16000.0
//        // 音频通道数 1 或 2
//        setting[AVNumberOfChannelsKey] = 1
//        // 线性音频的位深度  8、16、24、32
//        setting[AVLinearPCMBitDepthKey] = 16
//        //录音的质量 AVAudioQualityHigh
//        setting[AVEncoderAudioQualityKey] = NSNumber(value: 3)
//        
//        let recorders: AVAudioRecorder = try! AVAudioRecorder.init(url: self.recordFileUrl, settings: setting)
//        recorders.delegate = self
//        recorders.isMeteringEnabled = true
//        recorders.prepareToRecord()
//        return recorders
//    }()
    

    static let sharedInstance = YURecordTool()
    fileprivate override init() {
    }
    
//    static id instance
//    //#pragma mark - 单例
//    /** 录音工具的单例 */
//    + (instancetype)sharedRecordTool {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//    if (instance == nil) {
//    instance = [[self alloc] init];
//    }
//    });
//    return instance;
//    }
    
//    + (instancetype)allocWithZone:(struct _NSZone *)zone {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//    if (instance == nil) {
//    instance = [super allocWithZone:zone];
//    }
//    });
//    return instance;
//    }
    
    
    /** 开始录音 */
    public func startRecording(){
        // 1.获取沙盒地址
        let filePath = YUFile.getPath().appending(YURecordFielName)
        //let filePath = NSHomeDirectory().appending("/tmp/test")
        self.recordFileUrl = URL.init(fileURLWithPath: filePath)
        YUPrint(filePath)
        
        var setting: Dictionary<String,Any> = Dictionary.init()
        // 音频格式
        setting[AVFormatIDKey] = NSNumber.init(value: kAudioFormatMPEG4AAC) //kAudioFormatLinearPCM
        // 录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
        setting[AVSampleRateKey] = 16000.0
        // 音频通道数 1 或 2
        setting[AVNumberOfChannelsKey] = 1
        // 线性音频的位深度  8、16、24、32
        setting[AVLinearPCMBitDepthKey] = 16
        //录音的质量 AVAudioQualityHigh
        setting[AVEncoderAudioQualityKey] = NSNumber(value: 3)
        
        let recorders: AVAudioRecorder = try! AVAudioRecorder.init(url: self.recordFileUrl, settings: setting)
        recorders.delegate = self
        recorders.isMeteringEnabled = true
        recorders.prepareToRecord()
        
        // 录音时停止播放 删除曾经生成的文件
//        self.stopPlaying()
//        self.destructionRecordingFile()
    
        // 真机环境下需要的代码
        let session: AVAudioSession = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSessionCategoryPlayAndRecord)
//        if (session == nil) {
//            print("Error creating session: \(session.description)")
//        }else{
            try? session.setActive(true)
            self.session = session
            self.recorder.record()
//        }
    }
    
    public func updateImage() {
        self.recorder.updateMeters()
        let lowPassResults: Double = pow(10, Double(self.recorder.peakPower(forChannel: 0)) * 0.05)
        let result: Float  = 10 * Float(lowPassResults)
        //NSLog(@"%f", result);
        var no: Int = 0
        if (result > 0 && result <= 1.3) {
            no = 1
        } else if (result > 1.3 && result <= 2) {
            no = 2
        } else if (result > 2 && result <= 3.0) {
            no = 3
        } else if (result > 3.0 && result <= 3.0) {
            no = 4
        } else if (result > 5.0 && result <= 10) {
            no = 5
        } else if (result > 10 && result <= 40) {
            no = 6
        } else if (result > 40) {
            no = 7
        }
    
        self.delegate?.recordTool(recordTool: self, didstartRecoring: no)
//        if ([self.delegate respondsToSelector:@selector(recordTool:didstartRecoring:)]) {
//            [self.delegate recordTool:self didstartRecoring: no];
//        }
    }
    
    /** 停止录音 */
    public func stopRecording(){
        if self.recorder.isRecording {
            self.recorder.stop()
            self.timer.invalidate()
        }
    }
    
    /** 播放录音文件 */
    public func playRecordingFile() {
        // 播放时停止录音
        self.recorder.stop()
        
        // 正在播放就返回
        if self.player.isPlaying {
            return
        }else {
            self.player = try? AVAudioPlayer(contentsOf: self.recordFileUrl)
            self.player.delegate = self
            try? self.session.setCategory(AVAudioSessionCategoryPlayback)
            self.player.play()
        }
    }
    
    /** 停止播放录音文件 */
    public func stopPlaying() {
        self.player.stop()
    }

    /** 销毁录音文件 */
    public func destructionRecordingFile() {
        let fileManager: FileManager = FileManager.default
        if (self.recordFileUrl != nil) {
            try? fileManager.removeItem(at: self.recordFileUrl)
        }
    }
    
    //#pragma mark - AVAudioRecorderDelegate
    public func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,successfully: Bool){
        if (successfully) {
            try? self.session.setActive(false)
        }
    }
    //#pragma mark - AVAudioPlayerDelegate
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer,successfully: Bool) {
        self.delegate?.recordToolDidFinishPlay(recordTool: self)
//        if ([self.delegate respondsToSelector:@selector(recordToolDidFinishPlay:)]) {
//            [self.delegate recordToolDidFinishPlay:self];
//        }
    }
}

extension YURecordTool {
   
    /// 获取录音权限 如果用户没有开启麦克风权限,不能让其录音
    ///
    /// - Returns: 返回YES为无拒绝,NO为拒绝录音
    public static func canRecord() -> Bool {
        var canR = false
        if (UIDevice.current.systemVersion as NSString).floatValue >= 7.0 {
            let audioSession = AVAudioSession.sharedInstance()
            if (audioSession.responds(to: #selector(AVAudioSession.requestRecordPermission(_:)))) {
                AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
                    canR = granted
                    if granted {
                        print("granted")
                    } else{
                        print("not granted"+"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风")
                        //DispatchQueue.main.async
                    }
                })
            }
        }else{
            canR = true
        }
        return canR
    }
}
