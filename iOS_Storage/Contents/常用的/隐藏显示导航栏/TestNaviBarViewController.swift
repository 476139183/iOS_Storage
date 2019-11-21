//
//  TestNaviBarViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/20.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TestNaviBarViewController: CQBaseViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("go", for: .normal)
        button.addTarget(self, action: #selector(gotoSecondVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "这是系统导航栏"
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 60))
        }
        
    }
    
    @objc private func gotoSecondVC() {
        let vc = TestNaviBarViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }

}
