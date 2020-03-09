//
//  ViewVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import XQProjectTool_iPhoneUI
import SVProgressHUD
import SnapKit

class ViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "View"
        self.view.backgroundColor = UIColor.white
        
        
        self.view.xq_addTap { (gesture) in
            SVProgressHUD.showInfo(withStatus: "点击了背景白色View")
        }
        
        let v = UIView()
        self.view.addSubview(v)
        v.backgroundColor = UIColor.orange
        v.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
        // 设置访问 id, 让测试模块可以直接通过 id, 访问这个 view
        v.accessibilityIdentifier = "view_0"
        
        // 点击
        v.xq_addTap { (gesture) in
            SVProgressHUD.showInfo(withStatus: "点击了橙色View")
        }
        
        
        
        let v1 = UIView()
        self.view.addSubview(v1)
        v1.backgroundColor = UIColor.blue
        v1.snp.makeConstraints { (make) in
            make.top.equalTo(v.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
        v1.accessibilityIdentifier = "view_1"
        
        v1.xq_addTap(withNumberOfTapsRequired: 2) { (gesture) in
            SVProgressHUD.showInfo(withStatus: "双击了蓝色View")
        }
        
        // 长按
        v1.xq_addLongPress { (gesture) in
            SVProgressHUD.showInfo(withStatus: "长按了蓝色View")
        }
        
        // 扫
        v1.xq_addSwipe(with: .up) { (gesture) in
            SVProgressHUD.showInfo(withStatus: "上扫蓝色View")
        }
        
        v1.xq_addSwipe(with: .down) { (gesture) in
            SVProgressHUD.showInfo(withStatus: "下扫蓝色View")
        }
        
        v1.xq_addSwipe(with: .left) { (gesture) in
            SVProgressHUD.showInfo(withStatus: "左扫蓝色View")
        }
        
        v1.xq_addSwipe(with: .right) { (gesture) in
            SVProgressHUD.showInfo(withStatus: "右扫蓝色View")
        }
        
        // 捏合
        
        weak var weakV1 = v1
        v1.xq_addPinch { (gesture) in
            SVProgressHUD.showInfo(withStatus: "捏合了蓝色View,\(gesture?.scale ?? -1)")
            
            let scale = gesture?.scale ?? 1
            
            v1.snp.updateConstraints { (make) in
               make.size.equalTo(CGSize.init(width: 100 * scale, height: 100 * scale))
            }
            
        }
        
        // 旋转
        v1.xq_addRotation { (gesture) in
            SVProgressHUD.showInfo(withStatus: "旋转了蓝色View,\(gesture?.rotation ?? -1)")

            let transform = CGAffineTransform(rotationAngle: gesture?.rotation ?? 0)
            weakV1?.transform = transform
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
