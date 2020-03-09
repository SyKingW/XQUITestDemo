//
//  ButtonVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import SVProgressHUD

class ButtonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "Button"
        self.view.backgroundColor = UIColor.gray
        
        self.initBtn()
        self.initBtn1()
        self.initBtn2()
        self.initBtn3()
    }
    
    
    let btn = UIButton.init()
    let btn1 = UIButton.init()
    let btn2 = UIButton.init()
    let btn3 = UIButton.init()
    
    func initBtn() {
        
        btn.backgroundColor = UIColor.black
        btn.setTitle("点击背景变白", for: .normal)
        btn.addTarget(self, action: #selector(respondsToWhite), for: .touchUpInside)
        btn.addTarget(self, action: #selector(respondsToRed), for: .touchDownRepeat)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    func initBtn1() {
        btn1.backgroundColor = UIColor.black
        btn1.setTitle("双击背景变红", for: .normal)
        btn1.addTarget(self, action: #selector(respondsToRed), for: .touchDownRepeat)
        self.view.addSubview(btn1)
        btn1.snp.makeConstraints { (make) in
            make.top.equalTo(self.btn.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func initBtn2() {
        btn2.setImage(UIImage.init(named: "back"), for: .normal)
        btn2.setBackgroundImage(UIImage.init(named: "Safari"), for: .normal)
        btn2.addTarget(self, action: #selector(respondsToImage), for: .touchDownRepeat)
        self.view.addSubview(btn2)
        btn2.snp.makeConstraints { (make) in
            make.top.equalTo(self.btn1.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func initBtn3() {
        btn3.setTitle("有文字, 图片, 背景图片", for: .normal)
        btn3.setTitleColor(UIColor.black, for: .normal)
        btn3.setImage(UIImage.init(named: "back"), for: .normal)
        btn3.setBackgroundImage(UIImage.init(named: "back"), for: .normal)
        btn3.addTarget(self, action: #selector(respondsToTextAndImage), for: .touchDownRepeat)
        self.view.addSubview(btn3)
        btn3.snp.makeConstraints { (make) in
            make.top.equalTo(self.btn2.snp.bottom).offset(20)
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
    
    @objc func respondsToImage() {
        SVProgressHUD.showInfo(withStatus: "只有图片都有")
    }
    
    @objc func respondsToTextAndImage() {
        SVProgressHUD.showInfo(withStatus: "文字和图片都有")
    }
    

}
