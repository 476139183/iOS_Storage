//
//  KingfisherListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class KingfisherListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "加载一般图片", targetVC: KingfisherLoadImageViewController()),
                          ItemModel(title: "加载本地gif与网络gif", targetVC: KingfisherLoadGifViewController()),
                          ItemModel(title: "高斯模糊", targetVC: KingfisherDimViewController()),
                          ItemModel(title: "圆角", targetVC: KingfisherCornerViewController())]
        
    }

}
