//
//  SwiftXibCustomPropertyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibCustomPropertyViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let navi2 = XibCustomNaviView()
        view.addSubview(navi2)
        navi2.title = "纯代码导航栏"
        navi2.backgroundColor = .orange
        navi2.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(500)
            make.height.equalTo(100)
        }
        
    }

}
