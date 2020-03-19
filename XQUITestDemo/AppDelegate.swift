//
//  AppDelegate.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let environment = ProcessInfo.processInfo.environment
        print("wxq: ", environment)

        
        
        if let value = environment["test"] {
            SVProgressHUD.showInfo(withStatus: "目前是自动化测试: \(value)")
        }else {
            SVProgressHUD.showInfo(withStatus: "正常启动")
        }
        
        return true
    }

    
    func applicationDidEnterBackground(_ application: UIApplication) {
//        SVProgressHUD.showInfo(withStatus: "挂到后台了")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        SVProgressHUD.showInfo(withStatus: "挂起App")
    }
    


}

