//
//  RxSwiftDemoListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class RxSwiftDemoListViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "基本操作", targetVC: RxSwiftDemoViewController()),
                          ItemModel(title: "登录页", targetVC: RxSwiftLoginViewController()),
                          ItemModel(title: "高度自适应", targetVC: RxSwiftDynamicTableViewController()),
                          ItemModel(title: "bind", targetVC: RxSwiftBindDemoViewController())]
        
    }
    
}
