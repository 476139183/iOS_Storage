//
//  CornerTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CornerTestViewController: CQBaseViewController {
    
    
    private lazy var redView: CornerRadiusView = {
        let view = CornerRadiusView()
        view.setCornerRadius(radius: 10, corners: [.topLeft, .topRight])
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
}
