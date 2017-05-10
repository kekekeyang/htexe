//
//  RootViewController.swift
//  HtHome
//
//  Created by 杨海涛 on 3/24/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.topViewController?.classForCoder == SecViewController.classForCoder() {
            self.tabBarController?.tabBar.isHidden = true
        }else {
            self.tabBarController?.tabBar.isHidden = false
        }
        print(self.navigationController!.topViewController!.classForCoder)

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
