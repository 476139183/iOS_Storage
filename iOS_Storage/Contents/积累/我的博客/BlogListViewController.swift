//
//  BlogListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BlogListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "简书", targetVC: MyBlogViewController())]
    }

}
