//
//  ViewController.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.orange
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "更多", style: .plain, target: self, action: #selector(respondsToMore))
    }
    
    @objc func respondsToMore() {
        let vc = NavigationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

