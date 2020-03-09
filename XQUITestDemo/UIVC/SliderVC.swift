//
//  SliderVC.swift
//  XQUITestDemo
//
//  Created by sinking on 2020/3/8.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit

class SliderVC: UIViewController {
    
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Slider"
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(self.slider)
        self.slider.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        
        
    }
    
    
    
}
