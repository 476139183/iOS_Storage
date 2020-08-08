//
//  StaticTableController1.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableController1: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "嵌套一个静态tableView"
        
        let vc = UIStoryboard(name: "StaticTableStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaticTableController")
        
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }

}
