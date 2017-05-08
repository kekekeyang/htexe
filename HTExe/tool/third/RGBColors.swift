//
//  RGBColors.swift
//  HTExe
//
//  Created by 杨海涛 on 3/27/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class RGBColors: UIColor {
    
    public func rgb(_ r: Int,_ g: Int,_ b: Int) -> UIColor {
        
        return self.rgba(r: r, g: g, b: b, a: 1)
    }
    
    public func rgba(r: Int, g: Int, b: Int, a: Float) -> UIColor {
        
        let max = 255
        
        let red = (r/max > 1) ? 1: r/max
        let green = (g/max > 1) ? 1: g/max
        let blue = (b/max > 1) ? 1: b/max
        
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(a))
    }

}
