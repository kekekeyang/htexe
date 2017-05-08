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

class Timer: UIView {
    
    override init(frame: CGRect) {
        if self = super.init() {
            <#code#>
        }
    }
    
    let cubeHeight  = 70.00
    let defaultFont = 70.00
    let fontName1   = "STHeitiJ-Light"
    let fontName2   = "CourierNewPSMT"
    
    
    let secondLab = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: self.cubeHeight))
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
