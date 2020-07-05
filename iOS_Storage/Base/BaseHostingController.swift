//
//  BaseHostingController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SwiftUI

/// SwiftUI 的 BaseController
class BaseHostingController<T: View>: UIHostingController<T> {
    
    lazy var naviBar: BaseNaviBar = {
        let navi = BaseNaviBar()
        return navi
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(naviBar)
        naviBar.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
    }

}
