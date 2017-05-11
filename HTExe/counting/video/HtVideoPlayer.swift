//
//  HtVideoPlayer.swift
//  HTExe
//
//  Created by 杨海涛 on 5/9/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit
import AudioToolbox //导入音频工具箱框架，使用系统声音服务


class HtVideoPlayer: NSObject {
    //音频播放对象
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    /**播放*/
    public func play() {
        
        self.localMusic()
        //背景音乐的播放需要现在info.plist进行社会 Required background。。。
        //self.backgroundMusic()
        //声明一个系统声音标志类型的声音变量
        let source = UserDefaults.standard.string(forKey: "music")
        
        var sounID: SystemSoundID = 0
        let path = Bundle.main.path(forResource: source, ofType: "mp3")
        //路径找不到就会报内存的错误
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &sounID)
    }
    //暂停
    public func stop(){
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        
    }
    func localMusic()  {
        let source = UserDefaults.standard.string(forKey: "music")
        let path = Bundle.main.path(forResource: source, ofType: "mp3")
        //        public init(fileURLWithPath path: String)
        let soundUrl = URL(fileURLWithPath: path!)
        
        //在音频播放前首先创建一个异常捕捉语句
        do{
            //对音频播放对象进行初始化，并加载指定的音频播放对象
            //            public init(contentsOf url: URL) throws
            
            try audioPlayer = AVAudioPlayer(contentsOf:soundUrl)
            //设置音频对象播放的音量的大小
            audioPlayer.volume = 1.0
            //设置音频播放的次数，-1为无限循环播放
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
        }catch{
            print(error)
        }
        
    }
    func backgroundMusic()  {
        //获取音频会话对象，改对象属于单利模式，也就是说不用开发者写，自行实例化，这个类在各种音频环境中起着非常重要的作用
        let session = AVAudioSession.sharedInstance()
        //在音频播放前，首先创建一个异常捕捉语句
        do{
            //启动音频会话管理，此时会阻断后台音乐播放
            try session.setActive(true)
            //设置音频播放类别，表示该应用仅支持音频播放
            try session.setCategory(AVAudioSessionCategoryPlayback)
            
            //定义一个字符串变量，描述声音文件的路径
            let path = Bundle.main.path(forResource: "callRing", ofType: "mp3")
            //将字符串路径转化为网址路径
            let soundUrl = URL(fileURLWithPath: path!)
            
            try audioPlayer = AVAudioPlayer(contentsOf:soundUrl)
            //为音频播放做好准备
            audioPlayer.prepareToPlay()
            //设置音量
            audioPlayer.volume = 1.1
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        }catch{
            print(error)
        }
        
    }
    
    
}
