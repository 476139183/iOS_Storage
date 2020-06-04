//
//  WKWebViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "加载GIF", targetVC: WebViewGifViewController()),
                          ItemModel(title: "注入HTML", targetVC: InjectHTMLViewController())]
        
    }
    
}
