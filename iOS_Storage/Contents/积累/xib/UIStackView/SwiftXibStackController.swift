//
//  SwiftXibStackController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibStackController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviHeight)
        }
        
        let orangeView = Bundle.main.loadNibNamed("XibStackView", owner: nil, options: nil)?.first as! XibStackView
        scrollView.addSubview(orangeView)
        orangeView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }

}
