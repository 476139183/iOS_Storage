//
//  HTMLViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import WebKit

class HTMLGrammerViewController: CQBaseViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        if let path = Bundle.main.path(forResource: "HTMLGrammer", ofType: ".html") {
            let url = URL.init(fileURLWithPath: path)
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
    }
    
}


extension HTMLGrammerViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
    
}
