//
//  NavigationVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit

class NavigationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: .plain, target: self, action: #selector(respondsToBack))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(systemName: "clock"), style: .plain, target: self, action: #selector(respondsToPush))
    }
    
    
    // MARK: - responds
    
    @objc func respondsToBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func respondsToPush() {
        self.navigationController?.pushViewController(NavigationVC(), animated: true)
    }


}
