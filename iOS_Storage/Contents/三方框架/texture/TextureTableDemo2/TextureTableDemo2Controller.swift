//
//  TextureTableDemo2Controller.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TextureTableDemo2Controller: ASViewController<ASTableNode> {
    
    private lazy var naviView: UIView = {
        let naviView = UIView()
        naviView.backgroundColor = .red
        return naviView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
    }

}
