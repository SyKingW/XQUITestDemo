//
//  XQUITestDemoUITests.swift
//  XQUITestDemoUITests
//
//  Created by WXQ on 2020/3/7.
//  Copyright © 2020 WXQ. All rights reserved.
//

import XCTest

class XQUITestDemoUITests: XCTestCase {

    /// 开启自动化测试时, 配置参数
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // 失败后是否继续
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        print("wxq: ", #function)
    }

    /// app 结束时
    override func tearDown() {
        print("wxq: ", #function)
    }
    
    /// 启动app性能测试
    func testLaunchPerformance() {
        
        print("wxq: ", #function)
        
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // 启动6次app
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                print("wxq measure: ", #function)
                // 启动app
                XCUIApplication().launch()
            }
        }
    }
    
    // 初始化自己的app
    let app = XCUIApplication()
    
    // 系统的 safari app
//    let sefariApp = XCUIApplication.init(bundleIdentifier: "com.apple.mobilesafari")
    // 微信app
//    let wechatApp = XCUIApplication.init(bundleIdentifier: "com.tencent.xin")

    /// app执行的任务
    func testExample() {
        print("wxq: ", #function)
        // 启动app
        app.launch()
        
        // 打印当前app视图等等的信息.
//        print(app.debugDescription)
        
//        self.testTabbar()
        self.testNavigation()
//        self.testBtn()
        
        // 执行完之后, 会自动结束app 
    }
    
    /// 测试 tabbar
    func testTabbar() {
        
        app.wait(for: .notRunning, timeout: 1)
        
        // 取 tabbar 上的 button 的标题来取
        let tabbar = app.windows.tabBars.buttons["我的"]
        tabbar.tap()
        
        app.wait(for: .notRunning, timeout: 1)
        
        let tabbar1 = app.windows.tabBars.buttons["首页"]
        tabbar1.tap()
        
        app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 navigation
    func testNavigation() {
        app.wait(for: .notRunning, timeout: 1)
        
        let btn = app.windows.navigationBars.buttons["更多"]
        btn.tap()
        
        app.wait(for: .notRunning, timeout: 2)
        
        print(app.debugDescription)
        let btn1 = app.windows.navigationBars.buttons["首页"]
        btn1.tap()
        
        app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 button
    func testBtn() {
        // 取第一个元素
        //        let btns = app.windows.buttons.firstMatch
        
        // 1秒后再执行, 免得看不清
        app.wait(for: .notRunning, timeout: 1)
        
        // 按照btn的标题来取
        let btns = app.windows.buttons["点击背景变白"]
        // 单机
        btns.tap()
        
        // 等待2秒, 不要设置 runningForeground, 不然你会发现停止无用
        app.wait(for: .notRunning, timeout: 2)
        
        let btns1 = app.windows.buttons["双击背景变红"]
        // 双击
        btns1.doubleTap()
        
        // 等待2秒
        app.wait(for: .notRunning, timeout: 2)
        
        
    }

    
}
