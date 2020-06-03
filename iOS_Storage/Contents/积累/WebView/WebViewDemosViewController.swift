//
//  WebViewDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class WebViewDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "WKWebView", targetVC: WKWebViewDemoViewController())]
        
    }

}
