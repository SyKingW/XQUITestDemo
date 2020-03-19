//
//  OtherViewController.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        
        let btn = UIButton()
        btn.frame = CGRect.init(x: 30, y: 150, width: 60, height: 60)
        btn.setTitle("点我", for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.accessibilityIdentifier = "touchMe"
        self.view.addSubview(btn)
    }
    
    
    
}
