//
//  ImageFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ImageFrameworkViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "SDWebImage", targetVC: CQSDWebImageViewController()),
                          ItemModel(title: "Kingfisher", targetVC: KingfisherListViewController()),
                          ItemModel(title: "YYImage", targetVC: CQYYImageViewController())]
        
    }
    
}
