//
//  TextFieldVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//


import UIKit
import SVProgressHUD

class TextFieldVC: UIViewController, UITextFieldDelegate {
    
    
    let tf = UITextField.init()
    let tf1 = UITextField.init()
    
    let btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "TextField"
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(tf)
        self.tf.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().offset(20)
        }
        self.tf.accessibilityIdentifier = "test_tf_acc"
        self.tf.placeholder = "账号"
        
        self.tf.delegate = self
        
        
        
        self.view.addSubview(tf1)
        self.tf1.snp.makeConstraints { (make) in
            make.top.equalTo(self.tf.snp.bottom).offset(30)
            make.left.right.equalToSuperview().offset(20)
        }
        self.tf1.accessibilityIdentifier = "test_tf_pwd"
        self.tf1.placeholder = "密码"
        self.tf1.isSecureTextEntry = true
        
        
        self.view.addSubview(self.btn)
        self.btn.snp.makeConstraints { (make) in
            make.top.equalTo(self.tf1.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        self.btn.accessibilityIdentifier = "test_login"
        self.btn.setTitle("登录", for: .normal)
        self.btn.backgroundColor = UIColor.orange
        self.btn.addTarget(self, action: #selector(respondsToLogin), for: .touchUpInside)
        
    }
    
    
    // MARK: - responds
    
    @objc func respondsToLogin() {
        SVProgressHUD.showInfo(withStatus: "登录成功\n账号:\(self.tf.text ?? "没有")\n密码:\(self.tf1.text ?? "没有")")
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SVProgressHUD.showInfo(withStatus: "点击了 Return")
        return true
    }
    
    
}
