//
//  GetVCViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GetVCViewController: CQBaseViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}
