//
//  Timer.swift
//  HTExe
//
//  Created by 杨海涛 on 5/8/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

//#define cubeHeiht   70
//#define defalutFont 70
//#define t1          @"STHeitiJ-Light"
//#define t2          @"CourierNewPSMT"

class TimerView: UIView {
    
    let cubeHeight  = 70.00
    let defaultFont = 70.00
    let fontName1   = "STHeitiJ-Light"
    let fontName2   = "CourierNewPSMT"
    
    /**aviable*/
    let secondLab = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height:  70))
//    let minuteLab = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height:  70))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.addSubview(minuteLab)
        self.addSubview(secondLab)
        
        let font = UIFont.init(name: "CourierNewPSMT", size: 88)
        secondLab.font = font
        secondLab.textAlignment = .center
        secondLab.text = "0:00.0"
        secondLab.textColor = HexColor.init("#666666")
       
    }
    
    public func setStr(_ str: String) {
        print(str)
         DispatchQueue.main.async {
            self.secondLab.text = str
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
