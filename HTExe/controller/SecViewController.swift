//
//  SecViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class SecViewController: RootViewController {
    
    let timer1: TimerView = TimerView.init(frame: CGRect.init(x: 0, y: 150, width: SCREEN_WIDTH, height: 70.0))
    
    let fire: UIButton = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - 160)/3-20, y: 300, width: 80, height: 80))
    
    var count: CGFloat = 0
    var secends: CGFloat = 0.0
    var minutes: CGFloat = 0.0
    var timer: Timer?
    var isFire: Bool = false
    
    
    func setFireButton()  {
        self.view .addSubview(fire)
        fire.setTitle("START", for: .normal)
        fire.setTitleColor(HexColor.init("#789087"), for: .normal)
        fire.setTitleColor(HexColor.init("#030303"), for: .selected)
        fire.addTarget(self, action: #selector(fireTheHole(_ :)), for: .touchUpInside)
        fire.layer.masksToBounds = true;
        fire.layer.borderWidth = 1;
        fire.layer.cornerRadius = 40;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(timer1)
        
        self.setFireButton()
        

    }
    
    //开始计时
    func fireTheHole(_ button: UIButton) {
//        button.isSelected = !button.isSelected
        if (self.timer == nil) {
            self.timer =  Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:  #selector(counting), userInfo: nil, repeats: true)
        }
        
        
        self.isFire = !self.isFire
        if self.isFire {
            //start
//            self.timer.fireDate = NSDate.distantFuture
            self.timer?.fire()
        }else {
            //stop
            //            self.timer.fireDate = NSDate.distantPast
            self.timer?.invalidate()
            self.timer = nil
        }
            //stop forever
//        self.timer.invalidate() 
    }
    
    func counting() {
        self.count += 1
        
        self.secends = self.count/10
        
        if(self.secends >= 60.0){
            self.count = 0.0
            self.secends = 0.0
            self.minutes += 1
        }
        
        if self.secends < 10.0 {
            DispatchQueue.main.async {
                self.timer1.secondLab.text = NSString.init(format: "%.lf:0%.1lf", self.minutes, self.secends) as String
            }
        }else {
            DispatchQueue.main.async {
            self.timer1.secondLab.text = NSString.init(format: "%.lf:%.1lf", self.minutes, self.secends) as String
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
