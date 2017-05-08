//
//  RootNCViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class RootNCViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    public func removeTheLine(color: UIColor) {
        self.navigationBar.barTintColor =  UIColor.init(red: 28/255, green: 207/255, blue: 201/255, alpha: 1)
        self.navigationBar.setBackgroundImage(UIImage.init(), for: .any, barMetrics: .default)
        self.navigationBar.shadowImage = UIImage.init()
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
