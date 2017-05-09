//
//  SecViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class SecViewController: RootViewController {
    
    let player: HtVideoPlayer = HtVideoPlayer()
    
    let round: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 130, width: SCREEN_WIDTH, height: 50))
    
    
    let timer1: TimerView = TimerView.init(frame: CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height: 70.0))
    let timer2: TimerView = TimerView.init(frame: CGRect.init(x: 0, y: 300, width: SCREEN_WIDTH, height: 70.0))
    
    let progress = UIProgressView.init(frame: CGRect.init(x: 10, y: 275, width: SCREEN_WIDTH - 20, height: 10))
    
    let fire: UIButton = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - 160)/3, y: 420, width: 80, height: 80))
    let reset: UIButton = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH - 80 - (SCREEN_WIDTH - 160)/3, y: 420, width: 80, height: 80))
    
    
    
    //运行总时间
    var count: CGFloat = 300
    var secends: CGFloat = 0.0
    var minutes: CGFloat = 0.0
    var timer: Timer?
    var isFire: Bool = false
    var isExer: Bool! = true
    
    let total: Int = 8
    var curre: Int = 0
    
    
    func setRound() {
        self.view.addSubview(round)
        round.textColor = HexColor.init("#808080")
        round.text = NSString.init(format: "回合 %d/%d", self.curre, self.total) as String
        round.font = UIFont.init(name: "CourierNewPSMT", size: 46)
        round.textAlignment = .center
    }
    
    func setFireButton()  {
        self.view.addSubview(fire)
        fire.setTitle("开始", for: .normal)
        fire.setTitleColor(HexColor.init("#65ff21"), for: .normal)
        fire.addTarget(self, action: #selector(fireTheHole(_ :)), for: .touchUpInside)
        fire.layer.masksToBounds = true;
        fire.layer.borderWidth = 1;
        fire.layer.cornerRadius = 40;
        fire.layer.borderColor = HexColor.init("#65ff21")?.cgColor
    }
    func setResetButton()  {
        self.view.addSubview(reset)
        reset.setTitle("复位", for: .normal)
        reset.setTitleColor(HexColor.init("#1f1f1f"), for: .normal)
        reset.addTarget(self, action: #selector(resetTimer(_ :)), for: .touchUpInside)
        reset.layer.masksToBounds = true;
        reset.layer.borderWidth = 1;
        reset.layer.cornerRadius = 40;
        reset.layer.borderColor = HexColor.init("#1f1f1f")?.cgColor
    }
    
    func setProgressView() {
        self.view.addSubview(progress)
        progress.trackTintColor = HexColor.init("#169966")
        progress.progressViewStyle = .bar
        progress.backgroundColor = HexColor.init("#ff9999")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavItem()
        self.setRound()
        self.view.addSubview(timer1)
        self.view.addSubview(timer2)
        
        self.setProgressView()
        
        self.setFireButton()
        self.setResetButton()

    }
    //重置
    func resetTimer(_ button: UIButton) {
        self.timer?.invalidate()
        self.timer = nil
        fire.setTitle("开始", for: .normal)
        fire.setTitleColor(HexColor.init("#65ff21"), for: .normal)
        fire.layer.borderColor = HexColor.init("#65ff21")?.cgColor
        self.count = 300
        self.timer1.setStr("0:20.0")
        self.timer2.setStr("0:10.0")
        
        self.progress.progress = 0.0
        self.curre = 0
        
        player.stop()
        
    }
    //开始计时
    func fireTheHole(_ button: UIButton) {
//        button.isSelected = !button.isSelected
        if (self.timer == nil) {
            self.timer =  Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:  #selector(counting), userInfo: nil, repeats: true)
        }
        
        self.isFire = !self.isFire
        if self.isFire {
            player.play()
            fire.setTitle("暂停", for: .normal)
            fire.setTitleColor(HexColor.init("#123456"), for: .normal)
            fire.layer.borderColor = HexColor.init("#123456")?.cgColor
            self.timer?.fire()
        }else {
            player.stop()
            fire.setTitle("开始", for: .normal)
            fire.setTitleColor(HexColor.init("#65ff21"), for: .normal)
            fire.layer.borderColor = HexColor.init("#65ff21")?.cgColor
            button.isHighlighted = false
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    func counting() {
        self.count -= 1
        
        self.secends = self.count/10
        
        if(self.secends > 60.0){//暂时用不到
            //self.count = 0.0
            //self.secends = 0.0
            //self.minutes += 1
        }else if ( self.count > 100.0 ){
            //self.count = 0.0
            self.secends -= 10.0
            self.isExer = true
            let pro:CGFloat  = (20 - self.secends)/20
            self.progress.setProgress(Float(pro) , animated: true)
            self.progress.trackTintColor = UIColor.init(red: 33/255, green: pro, blue: 33/255, alpha: 0)
        }else if ( self.count <= 100.0 && self.count > 0 ){
            //self.count = 0.0
            //self.secends = 0.0
            self.isExer = false
            let pro:CGFloat  = (self.secends)/10
            self.progress.setProgress(Float(pro) , animated: true)
            self.progress.trackTintColor = UIColor.init(red: 33/255, green: pro , blue: 33/255, alpha: 0)
        }else if( self.count == 0.0){
            self.count = 300
            self.isExer = true
            self.curre += 1
            round.text = NSString.init(format: "回合 %d/%d", self.curre, self.total) as String
        }
        
        let strBelow10: String =  NSString.init(format: "%.lf:0%.1lf", self.minutes, self.secends) as String
        let strUp10: String =  NSString.init(format: "%.lf:%.1lf", self.minutes, self.secends) as String
        //判断一下谁在运行
        if  !self.isExer {
            self.timer1.setStr("0:20.0")
            if self.secends < 10.0 {
                self.timer2.setStr( strBelow10)
            }else {
                self.timer2.setStr( strUp10)
            }
        }else {
            self.timer2.setStr("0:10.0")
            if self.secends < 10.0 {
                //DispatchQueue.main.async {
                //    self.timer1.secondLab.text = NSString.init(format: "%.lf:0%.1lf", self.minutes, self.secends) as String
                // }
                self.timer1.setStr(strBelow10)
            }else if(self.secends >= 10.0 && self.secends <= 20.0){
                self.timer1.setStr( strUp10)
            }

        }
        
        
//        DispatchQueue.main.async {
//            self.timer1.secondLab.text = countStr as String
//        }
        
        print(self.count, self.secends, self.minutes, NSString.init(format: "%.lf:%.1lf", self.minutes, self.secends))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setNavItem() {
        let rightBar = UIBarButtonItem.init(image: UIImage.init(named: "setting"), style: .plain, target: self, action: #selector(navigateSetting))
        self.navigationItem.setRightBarButtonItems([rightBar], animated: true)
    }
    
    func navigateSetting() {
        let setting = SetViewController()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: true)
    }
    
    //        let fountA = UIFont.familyNames
    //        var itemy = 50
    //        for item in fountA {
    //            let time = TimerView.init(frame: CGRect.init(x: 0, y: itemy, width: Int(SCREEN_WIDTH), height: 20))
    //            time.secondLab.font = UIFont.init(name: item, size: 20)
    //            itemy += 20
    //            self.view.addSubview(time)
    //        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
