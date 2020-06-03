//
//  NestedItemWebView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import WebKit

class NestedItemWebView: UIView, UIScrollViewDelegate, JXPagingViewListViewDelegate {
    
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    // MARK: - Lazy
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        let url = URL(string: "https://www.baidu.com")
        webView.load(URLRequest(url: url!))
        webView.scrollView.delegate = self
        return webView
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(webView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        webView.frame = self.bounds
    }
    
    
    // MARK: - Delegate - UIScrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
    
    
    // MARK: - JXPagingViewListViewDelegate
    
    func listView() -> UIView {
        return self
    }
    
    func listScrollView() -> UIScrollView {
        return webView.scrollView
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }
    
}
