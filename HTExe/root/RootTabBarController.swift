//
//  RootTabBarController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit


class RootTabBarController: UITabBarController {
    
    let firstVC = FirstViewController()
    let secendVC = SecViewController()
    let thirdVC  = ThirdViewController()
    
    func initViewController() {
        let firstNC = RootNCViewController.init(rootViewController:firstVC)
        let firstItem = UITabBarItem.init(title: "FIRST", image: UIImage.init(named: "noResizeApi"), selectedImage: UIImage.init(named: "resizeApi"))
        firstVC.title = "FIRST"
        firstNC.tabBarItem = firstItem
        
        let secNC = RootNCViewController.init(rootViewController: secendVC)
        let secItem = UITabBarItem.init(title: "计时器", image: UIImage.init(named: "tab-time"), selectedImage: UIImage.init(named: "tab-time-f"))
        secendVC.title = "计时器"
        secNC.tabBarItem = secItem
        
        let thirdNC = RootNCViewController.init(rootViewController: thirdVC)
        let thirdItem = UITabBarItem.init(title: "THIRD", image: UIImage.init(named: "noResizeApi"), selectedImage: UIImage.init(named: "resizeApi"))
        thirdVC.title = "THIRD"
        thirdNC.tabBarItem = thirdItem
        
        self.viewControllers = [ firstNC, secNC, thirdNC]
        
        self.tabBar.tintColor = UIColor.red
        
        self.selectedIndex = 1
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewController()
        
        
        
        
        // Do any additional setup after loading the view.
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
