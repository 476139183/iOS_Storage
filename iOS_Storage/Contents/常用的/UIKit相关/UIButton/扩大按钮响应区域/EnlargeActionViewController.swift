//
//  EnlargeActionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class EnlargeActionViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton()
        view.addSubview(button)
        button.setEnlargeEdgeWithTop(30, right: 30, bottom: 30, left: 30)
        button.backgroundColor = .red
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 30
        button.layer.shadowColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
    }
    
    @objc private func buttonClicked() {
        print("clicked")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
    }

}
