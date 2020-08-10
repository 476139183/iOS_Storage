//
//  BlogDetailViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
import WebKit

class BlogDetailViewController: CQBaseViewController {
    
    private var slug = ""
    
    private lazy var webView: WKWebView = {
        let web = WKWebView.init()
        return web
    }()
    
    init(slug: String) {
        super.init(nibName: nil, bundle: nil)
        self.slug = slug
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        loadData()
    }
    
    private func loadData() {
        let url = URL.init(string: "https://www.jianshu.com/p/\(self.slug)")!
        self.webView.load(.init(url: url))
    }

}
