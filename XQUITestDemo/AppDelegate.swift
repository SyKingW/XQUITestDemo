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
        
//        self.window?.rootViewController = ViewController()
//        self.window?.makeKeyAndVisible()
        
        return true
    }

    
    func applicationDidEnterBackground(_ application: UIApplication) {
        SVProgressHUD.showInfo(withStatus: "挂到后台了")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        SVProgressHUD.showInfo(withStatus: "挂起App")
    }
    


}

