//
//  FirstViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class FirstViewController: RootViewController {
    
    
    let dashBoard = UIButton.init(frame: CGRect.init(x: 20, y:84, width: SCREEN_WIDTH - 40, height: 40))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dashBoard)
        dashBoard.backgroundColor = UIColor.init(red: 28/255, green: 207/255, blue: 201/255, alpha: 1)
        dashBoard.setTitle("DashBoard", for: .normal)
        dashBoard.addTarget(self, action: #selector(pushDashBoard(_ :)), for: .touchUpInside)
        
        
    }
    
    func pushDashBoard(_ button: UIButton) {
        
        button.setTitle("", for: .normal)
        UIView.animate(withDuration: 0.5, animations: {
            button.frame = CGRect.init(x: (SCREEN_WIDTH - 40)/2, y: 84, width: 40, height: 40)
            button.layer.cornerRadius = 20
        }) { (true) in
//            UIView.animate(withDuration: 0.5, animations: {
//                button.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//                button.layer.cornerRadius = 0.0
//            }) { (true) in
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                let dashBoard = DashBoardViewController.init()
//                let rnc = RootNCViewController.init(rootViewController:dashBoard)
//                appDelegate.window?.rootViewController = rnc
//                print("hello")
//            }
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 3, initialSpringVelocity: 2, options: .curveLinear, animations: {
                button.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                button.layer.cornerRadius = 0.0
            }) { (true) in
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let dashBoard = DashBoardViewController.init()
                let rnc = RootNCViewController.init(rootViewController:dashBoard)
                rnc.removeTheLine(color: UIColor.init(red: 28/255, green: 207/255, blue: 201/255, alpha: 1))
                appDelegate.window?.rootViewController = rnc
                print("hello")
            }
            
        }
       
        print("nihao")
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
