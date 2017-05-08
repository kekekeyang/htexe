//
//  FirstViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit
import HexColors

class FirstViewController: RootViewController {
    
    let label = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 30))
    
    let dashBoard = UIButton.init(frame: CGRect.init(x: 20, y:84, width: SCREEN_WIDTH - 40, height: 30))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(label)
        label.backgroundColor = UIColor.green
        label.text = "你好啊！"
        
        self.view.addSubview(dashBoard)
        dashBoard.backgroundColor = UIColor.init(he)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
