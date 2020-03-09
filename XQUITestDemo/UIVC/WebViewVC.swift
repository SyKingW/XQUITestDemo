//
//  WebViewVC.swift
//  XQUITestDemo
//
//  Created by WXQ on 2020/3/9.
//  Copyright © 2020 WXQ. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class WebViewVC: UIViewController {
    
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "WebView"
        self.view.backgroundColor = UIColor.white
        
        let config = WKWebViewConfiguration.init()
        self.webView = WKWebView.init(frame: CGRect.zero, configuration: config)
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        
        if let url = URL.init(string: "https://cn.bing.com/") {
            self.webView.load(URLRequest.init(url: url))
        }else {
            SVProgressHUD.showError(withStatus: "url初始化错误")
        }
        
    }
    
    
}
