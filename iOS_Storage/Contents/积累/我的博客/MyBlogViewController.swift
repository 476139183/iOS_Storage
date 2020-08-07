//
//  MyBlogViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MyBlogViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// uid: 4212f351f6b5
// 列表： https://www.jianshu.com/asimov/users/slug/4212f351f6b5/public_notes
// 文章内容： https://www.jianshu.com/asimov/p/f936bb30f

class BlogItemModel {
    var title = ""
    var slug = ""
    var first_shared_at = ""
    var list_image_url = ""
}
