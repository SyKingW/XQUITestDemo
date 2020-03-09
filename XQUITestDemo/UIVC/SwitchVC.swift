//
//  SwitchVC.swift
//  XQUITestDemo
//
//  Created by sinking on 2020/3/8.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit

class SwitchVC: UIViewController {
    
    let testSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Switch"
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(self.testSwitch)
        self.testSwitch.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
    }
    

}
