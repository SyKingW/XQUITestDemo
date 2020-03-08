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
        print("wxq: ", #function)

        // 失败后是否继续
        continueAfterFailure = false
    }

    /// app 结束时
    override func tearDown() {
        print("wxq: ", #function)
    }
    
    /// 启动app测试
    func testLaunchPerformance() {
        print("wxq: ", #function)
        
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // 性能测试, 启动6次app
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
//        self.testNavigation()
//        self.testView()
//        self.testLabel()
//        self.testBtn()
        self.testTextField()
        
        
        // 执行完之后, 会自动结束app 
    }
    
    /// 测试 tabbar
    func testTabbar() {
        
        // 1秒后再执行, 免得看不清
        // 等待1秒, 不要设置 runningForeground, 不然你会发现停止无用
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 tabbar 上的 button 的标题来取
        let tabbar = app.windows.tabBars.buttons["我的"]
        // 点击视图
        tabbar.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let tabbar1 = app.windows.tabBars.buttons["首页"]
        tabbar1.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 navigation
    func testNavigation() {
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 如果是title, 则传名称取button
        let btn = app.windows.navigationBars.buttons["更多"]
        btn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 如果是图片, 则图片名称取button
        let btn1 = app.windows.navigationBars.buttons["clock"]
        btn1.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btn2 = app.windows.navigationBars.buttons["back"]
        btn2.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btn3 = app.windows.navigationBars.buttons["back"]
        btn3.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
    }
    
    /// 测试 View
    func testView() {
        // 取第一个元素
        //        let btns = app.windows.buttons.firstMatch
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 0)
        // 这样直接取第一个也可以
//        let view = app.windows.cells.firstMatch
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 点击当前控制器的View, 直接这样点就行了
        app.windows.firstMatch.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        print(app.debugDescription)
        
        /// UIView 显示的类型是 other, 想取出来, 比较困难
        /// 这个时候, 就利用到 accessibilityIdentifier 属性了
        /// 只要项目代码中设置了 id, 那么这边就能直接通过 id 访问
        let v0 = app.windows.otherElements.element(matching: .other, identifier: "view_0")
        v0.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let v1 = app.windows.otherElements.element(matching: .other, identifier: "view_1")
        // 长按
        v1.press(forDuration: 2)
        
        
        // 扫
        v1.swipeUp()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeDown()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeLeft()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        v1.swipeRight()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 捏合
        v1.pinch(withScale: 1.5, velocity: 1)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 旋转
        v1.rotate(0.5, withVelocity: 1)
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let backBtn = app.windows.navigationBars.buttons["首页"]
        backBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
    /// 测试 View
    func testLabel() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 手势都在 view 那边测完了, label 这边没什么好试的...
        
    }
    
    /// 测试 button
    func testBtn() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 2)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        print(app.debugDescription)
        
        // 如果只有标题, 则可以根据 button 的标题来取
        let btns = app.windows.buttons["点击背景变白"]
        btns.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let btns1 = app.windows.buttons["双击背景变红"]
        // 双击视图
        btns1.doubleTap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 只存在图片
        // 注意, backImage 和 image，同时存在的话，是 Image 优先
        let _ = app.windows.buttons["back"]
        
        // 文字和图片都存在
        let _ = app.windows.buttons["有文字, 图片, 背景图片"]
        
        ///
        /// 总体来说
        /// 文字 > 图片 > 背景图片
        ///
        
        
        
        let backBtn = app.windows.navigationBars.buttons["首页"]
        backBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }

    /// 测试 textField
    func testTextField() {
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 取 cell, 根据下标取
        let view = app.windows.cells.element(boundBy: 3)
        view.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 可以靠 placeholder, 或者 text 属性取出来..
        // 但还是建议用 accessibilityIdentifier 属性
        let tf = app.textFields.element(matching: .textField, identifier: "test_tf_acc")
        // 需要先点击, 然后再输入
        tf.tap()
        tf.typeText("1232347293847983")
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        // 注意, 密码是需要取 secureTextField
        let tf1 = app.secureTextFields.element(matching: .secureTextField, identifier: "test_tf_pwd")
        tf1.tap()
        tf1.typeText("123sdjsdjejeew")
        
        
        let btn = app.buttons.element(matching: .button, identifier: "test_login")
        btn.tap()
        
        
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
        let backBtn = app.windows.navigationBars.buttons["首页"]
        backBtn.tap()
        
        let _ = app.wait(for: .notRunning, timeout: 1)
        
    }
    
}
