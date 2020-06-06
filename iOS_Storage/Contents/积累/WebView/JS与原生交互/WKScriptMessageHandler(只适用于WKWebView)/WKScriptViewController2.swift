//
//  WKScriptViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import WebKit

class WKScriptViewController2: CQBaseViewController {
    
    private var isInjected: Bool = false
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        if let path = Bundle.main.path(forResource: "kq2", ofType: ".html") {
            let url = URL.init(fileURLWithPath: path)
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
        return webView
    }()
    
    private lazy var changeColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("原生按钮 change color", for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(changeColorButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight + 50)
        }
        
        view.addSubview(changeColorButton)
        changeColorButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(kNavigationBarHeight+10)
            make.height.equalTo(30)
        }
        
    }
    
    // 原生调用JS，不带参数
    @objc private func changeColorButtonClicked() {
        callJsFunction("changeColor()")
    }

}


extension WKScriptViewController2: WKScriptMessageHandler {
    
    // MARK: - JS 调用原生
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        print(message.name)
        
//        guard message.name == BrowserViewController.BRIDGE_NAME, let request = JSRequest.initFromJSONString(object: message.body) else {
//            return
//        }
//        userContentControllerDidReceiveAction(request: request)
    }

    // MARK: - 原生调用 JS
    func callJsFunction(_ paramStr: String) {
        self.webView.evaluateJavaScript(paramStr, completionHandler: nil)
    }
}


extension WKScriptViewController2: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
        if isInjected == true {
            return
        }
        self.isInjected = true
        // get HTML text
        let js = "document.body.outerHTML"
        webView.evaluateJavaScript(js) { (html, error) in
            let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>"
            webView.loadHTMLString(headerString + (html as! String), baseURL: nil)
        }
    }
}
