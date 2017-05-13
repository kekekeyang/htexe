//
//  TCoverTab.swift
//  HTExe
//
//  Created by 杨海涛 on 5/13/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

import UIKit

class TCoverTab: UIView, UITableViewDelegate, UITableViewDataSource {
    
    
// MARK: - property
    let dataList = ["music000","music001","music002","music003","music004","music005",
                    "music006","music007","music008","music009","music010","music011"]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let tabView: UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style: .plain)

// MARK: - func
    func tabViewSet() {
        
        self.tabView.delegate = self
        self.tabView.dataSource = self
        self.tabView.rowHeight = 20
        self.tabView.backgroundColor = UIColor.white
//        self.tabView.
        self.addSubview(self.tabView)
    }
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT/2, width: SCREEN_WIDTH, height: 1)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hidden))
        self.addGestureRecognizer(tap)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.tabViewSet()
    }
    
    public func show() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: .calculationModeCubic, animations: {
            self.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            self.tabView.frame = CGRect.init(x: 10, y: 110, width: SCREEN_WIDTH - 20, height: SCREEN_HEIGHT - 300)
        }) { (true) in
            self.appDelegate.window?.addSubview(self)
        }
        
    }
    public func hidden() {
        UIView.animate(withDuration: 0.2, animations: { 
            self.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT/2, width: SCREEN_WIDTH, height: 0)
        }) { (true) in
            self.appDelegate.window?.willRemoveSubview(self)
            self.removeFromSuperview()
        }
    }
    
// MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iden: String = "tCover"
        var cell = tabView.dequeueReusableCell(withIdentifier: iden)!
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier:iden )
            cell.selectionStyle = .none
        }
        cell.textLabel?.text = self.dataList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(self.dataList[indexPath.row], forKey: "music")
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
