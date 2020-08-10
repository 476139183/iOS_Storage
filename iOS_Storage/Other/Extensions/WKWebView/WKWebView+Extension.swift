//
//  WKWebView+Extension.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    
    /// load HTML String same font like the UIWebview
    ///
    //// - Parameters:
    ///   - content: HTML content which we need to load in the webview.
    ///   - baseURL: Content base url. It is optional.
    func loadHTMLStringWithMagic(content:String,baseURL:URL?){
        let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>"
        loadHTMLString(headerString + content, baseURL: baseURL)
    }
    
}
