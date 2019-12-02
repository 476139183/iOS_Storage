//
//  WKWebViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewDemoViewController: CQBaseViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        let path = Bundle.main.path(forResource: "加载中", ofType: "gif")!
        let url = URL.init(fileURLWithPath: path)
        //webView.loadFileURL(url, allowingReadAccessTo: nil)
        webView.load(URLRequest.init(url: url))
        return webView
    }()
    
    private lazy var webView1: WKWebView = {
        let webView = WKWebView()
        let url = URL(string: "https://miss.mynatapp.cc/other/list.html")
        webView.load(URLRequest.init(url: url!))
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(webView1)
        webView1.frame = view.bounds
        
    }
    
    
    
}
