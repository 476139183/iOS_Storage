//
//  AlamofireDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class AlamofireDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataArray = [ItemModel(title: "普通请求", targetVC: AlamofireRequestViewController()),
                          ItemModel(title: "上传", targetVC: AlamofireUploadViewController()),
                          ItemModel(title: "下载", targetVC: AlamofireDownloadViewController())]
    }
    
}
