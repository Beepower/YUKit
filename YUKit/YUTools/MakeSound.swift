//
//  MakeSound.swift
//  PowerCC
//
//  Created by chenliangyu on 15/12/30.
//  Copyright © 2015年 Whale. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation


/// 声音
open class MakeSound: NSObject {

    /// 声音播放
    public class func systemSound() {
//        let soundID: SystemSoundID = 0//建立的SystemSoundID对象
//        let path = NSBundle.mainBundle().pathForResource("msg", ofType: "wav")//获取声音地址
//        let baseURL = NSURL(fileURLWithPath: path!)//地址转换
//        AudioServicesCreateSystemSoundID(baseURL, soundID)//赋值
//        AudioServicesPlaySystemSound(soundID)//播放声音
        if YUDefaults.bool(forKey: "switch1") {
            let soundPath: String = "/System/Library/Audio/UISounds/new-mail.caf"
            var soundID: SystemSoundID = 0
            let soundURL = URL(fileURLWithPath: soundPath)
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
    }
    
    public class func Sound() {
        let soundPath: String = "/System/Library/Audio/UISounds/sms-received1.caf"
        //new-mail.caf
        var soundID: SystemSoundID = 0
        let soundURL = URL(fileURLWithPath: soundPath)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    public class func playSuccessSound() {
        let soundURL = Bundle.main.url(forResource: "msg", withExtension: "wav")
        var soundID : SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL! as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
        //also vibrate
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate));
    }

    
    
//
////    （2）提醒
//    class func systemAlert(sender: AnyObject) {
//        //建立的SystemSoundID对象
//        let soundID:SystemSoundID = 0
//        //获取声音地址
//        let path = NSBundle.mainBundle().pathForResource("msg", ofType: "wav")
//        //地址转换
//        let baseURL = NSURL(fileURLWithPath: path!)
//        //赋值
//        AudioServicesCreateSystemSoundID(baseURL, &soundID)
//        //提醒（同上面唯一的一个区别）
//        AudioServicesPlayAlertSound(soundID)
//    }
    
//    （3）振动
    public class func systemVibration() {
        //建立的SystemSoundID对象
        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        //振动
        AudioServicesPlaySystemSound(soundID)
    }
    
    /**
     振动
     */
    public class func ShakeSound() {
        let userDefault = UserDefaults.standard
        if userDefault.bool(forKey: "switch0") {
            //建立的SystemSoundID对象
            let soundID = SystemSoundID(kSystemSoundID_Vibrate)
            AudioServicesPlaySystemSound(soundID)
        }
    }
    
    
    /// 默认振动
    public class func Shake() {
        //建立的SystemSoundID对象
        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        AudioServicesPlaySystemSound(soundID)
    }
    
    public class func playVoice(_ name: String,type: String) {
        let soundPath = Bundle.main.path(forResource: name, ofType: type)
        var soundID: SystemSoundID = 0//static SystemSoundID shake_sound_male_id = 0;
        let soundURL = URL(fileURLWithPath: soundPath!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }


}
