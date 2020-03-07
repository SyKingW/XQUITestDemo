//
//  ButtonVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.gray
        
        self.initBtn()
        self.initBtn1()
        
    }
    
    
    let btn = UIButton.init()
    let btn1 = UIButton.init()
    
    func initBtn() {
        
        btn.backgroundColor = UIColor.black
        btn.setTitle("点击背景变白", for: .normal)
        btn.addTarget(self, action: #selector(respondsToWhite), for: .touchUpInside)
        btn.addTarget(self, action: #selector(respondsToRed), for: .touchDownRepeat)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
    }
    
    func initBtn1() {
        let btn1 = UIButton.init()
        btn1.backgroundColor = UIColor.black
        btn1.setTitle("双击背景变红", for: .normal)
        btn1.addTarget(self, action: #selector(respondsToRed), for: .touchDownRepeat)
        self.view.addSubview(btn1)
        btn1.snp.makeConstraints { (make) in
            make.top.equalTo(self.btn.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - responds
    
    @objc func respondsToWhite() {
        print(#function)
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func respondsToRed() {
        print(#function)
        self.view.backgroundColor = UIColor.red
    }
    

}
