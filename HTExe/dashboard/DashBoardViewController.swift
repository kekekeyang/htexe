//
//  DashBoardViewController.swift
//  HTExe
//
//  Created by 杨海涛 on 3/27/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit
import Alamofire

class DashBoardViewController: RootViewController {

    let dashBoard = UIButton.init(frame: CGRect.init(x: 20, y:84, width: 0, height: 0))
    let circleBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH - 60, y: SCREEN_HEIGHT - 40, width: 40, height: 40))
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DashBoard"
//        self.view.backgroundColor = UIColor.init(red: 28/255, green: 207/255, blue: 201/255, alpha: 1)
        
        self.view.addSubview(dashBoard)
        dashBoard.backgroundColor = UIColor.brown
        dashBoard.setTitle("Back", for: .normal)
        dashBoard.addTarget(self, action: #selector(pushDashBoard(_ :)), for: .touchUpInside)
        
        self.view.addSubview(circleBtn)
        circleBtn.backgroundColor = UIColor.black
        circleBtn.layer.cornerRadius = 20
        circleBtn.addTarget(self, action: #selector(showMenu(_:)), for: .touchUpInside)
//        self.navigationController?.navigationBar.barTintColor =  UIColor.init(red: 28/255, green: 207/255, blue: 201/255, alpha: 1)
//        self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.dashBoard.frame = CGRect.init(x: 20, y:84, width: SCREEN_WIDTH - 40, height: 40)
        }
    }
    func showMenu(_ button: UIButton) {
        
    }
    func pushDashBoard(_ button: UIButton) {
        UIView.animate(withDuration: 0.5) {
            button.setTitle("", for: .normal)
            button.frame = CGRect.init(x: (SCREEN_WIDTH - 40)/2, y: 84, width: 40, height: 40)
            button.layer.cornerRadius = 20;
            
        }
        UIView.animate(withDuration: 0.5, animations: {
            button.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            button.layer.cornerRadius = 0.0
        }) { (true) in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = RootTabBarController()
            print("hello")
        }
        
        print("nihao")
    }
    
    func getListView()  {
        let url = "https://apis.juhe.cn/cook/query?key=ff5dfc60259857cdbfc0c695965eca44&menu=%E8%A5%BF%E7%BA%A2%E6%9F%BF&rn=10&pn=3"
        Alamofire.request(url).responseJSON { (response: DataResponse) in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
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
