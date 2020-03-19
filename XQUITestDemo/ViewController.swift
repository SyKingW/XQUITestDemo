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
import XQAlert


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let result = "cell"
    var tableView: UITableView!
    var dataArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.orange
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "更多", style: .plain, target: self, action: #selector(respondsToMore))
        
        self.initTableView()
        
        
        
    }
    
    func initTableView() {
        
        self.tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: result)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.separatorStyle = .none
        
        
        self.dataArr = [
            "View",
            "Label",
            "Button",
            "TextField",
            "Slider",
            "Switch",
            "TableView",
            "WebView",
            "打开微信, 然后再跳转回来(还会自动点击第一次跳转的系统确定按钮)",
            "申请通知权限, 自动点击系统的确定按钮",
            "Alert",
            "AlertActionSheet",
        ]
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: result, for: indexPath)
        cell.textLabel?.text = self.dataArr[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ViewVC(), animated: true)
            
        case 1:
            self.navigationController?.pushViewController(LabelVC(), animated: true)
            
        case 2:
            self.navigationController?.pushViewController(ButtonVC(), animated: true)
            
        case 3:
            self.navigationController?.pushViewController(TextFieldVC(), animated: true)
            
        case 4:
            self.navigationController?.pushViewController(SliderVC(), animated: true)
            
        case 5:
            self.navigationController?.pushViewController(SwitchVC(), animated: true)
            
        case 6:
            self.navigationController?.pushViewController(TableViewVC(), animated: true)
            
        case 7:
            self.navigationController?.pushViewController(WebViewVC(), animated: true)
            
        case 8:
            if let url = URL.init(string: "weixin://") {
//            if let url = URL.init(string: "mqq://") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        case 9:
            let options = UNAuthorizationOptions.alert.rawValue | UNAuthorizationOptions.badge.rawValue | UNAuthorizationOptions.sound.rawValue
            UNUserNotificationCenter.current().requestAuthorization(options: UNAuthorizationOptions(rawValue: options)) { (result, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        SVProgressHUD.showInfo(withStatus: "申请权限失败: \(error)")
                    }else {
                        SVProgressHUD.showInfo(withStatus: "申请权限结果: \(result)")
                    }
                }
            }
            
        case 10:
            XQSystemAlert.alert(withTitle: "弹框", message: "副标题", contentArr: ["确定"], cancelText: "取消", vc: self, contentCallback: { (alert, index) in
                SVProgressHUD.showInfo(withStatus: "点击了确定")
            }) { (alert) in
                SVProgressHUD.showInfo(withStatus: "点击了取消")
            }
            
            
        case 11:
            XQSystemAlert.actionSheet(withTitle: "弹框", message: "副标题", contentArr: ["0", "1", "2"], cancelText: "取消", vc: self, contentCallback: { (alert, index) in
                SVProgressHUD.showInfo(withStatus: "点击了内容, 第\(index)个")
            }) { (alert) in
                SVProgressHUD.showInfo(withStatus: "点击了取消")
            }
            
        default:
            break
        }
    }
    
    // MARK: - responds
    
    @objc func respondsToMore() {
        let vc = NavigationVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

