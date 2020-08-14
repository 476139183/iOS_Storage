//
//  WebViewGifViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import WebKit

class WebViewGifViewController: CQBaseViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        let path = Bundle.main.path(forResource: "yeezy_loading", ofType: "gif")!
        let url = URL.init(fileURLWithPath: path)
        //webView.loadFileURL(url, allowingReadAccessTo: nil)
        webView.load(URLRequest.init(url: url))
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
    }

}
