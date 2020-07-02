//
//  SwiftXibCustomViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibCustomViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let redView: SwiftXibRedView = Bundle.main.loadNibNamed("SwiftXibRedView", owner: self, options: nil)?.first as! SwiftXibRedView
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(120)
        }
        
    }

}
