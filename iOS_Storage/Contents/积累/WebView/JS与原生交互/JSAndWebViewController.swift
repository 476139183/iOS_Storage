//
//  JSAndWebViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class JSAndWebViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataArray = [ItemModel(title: "拦截url", targetVC: InterceptUrlViewController()),
                          ItemModel(title: "WKScriptMessageHandler", targetVC: WKScriptViewController()),
                          ItemModel(title: "WKScriptMessageHandler2", targetVC: WKScriptViewController2())]
        
    }
    
}
