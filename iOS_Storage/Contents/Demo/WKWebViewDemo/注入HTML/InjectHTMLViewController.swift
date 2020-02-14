//
//  InjectHTMLViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import WebKit

class InjectHTMLViewController: CQBaseViewController, WKNavigationDelegate {
    
    private var isInjected: Bool = false
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        let url = URL(string: "https://www.baidu.com")
        webView.load(URLRequest.init(url: url!))
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(webView)
        webView.frame = view.bounds
    }
    
// MARK: - WKNavigationDelegate

func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    if isInjected == true {
        return
    }
    self.isInjected = true
    // get HTML text
    let js = "document.body.outerHTML"
    // inject
    webView.evaluateJavaScript(js) { (html, error) in
        let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>"
        webView.loadHTMLString(headerString + (html as! String), baseURL: nil)
    }
    
}
    
}
