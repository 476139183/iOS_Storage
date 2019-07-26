//
//  ObjectMapperDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ObjectMapperDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel.init(frame: CGRect.init(x: 90, y: 90, width: 90, height: 90))
        view.addSubview(label)
        label.text = "呵呵哒"
        label.font = UIFont.systemFont(ofSize: 10)
        label.backgroundColor = .orange
        
        let redView = UIView()
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp_baseline)
            make.left.equalTo(label.snp_right).offset(20)
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
    }
    
    
    

}
