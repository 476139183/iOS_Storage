//
//  LaunchGuideViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class LaunchGuideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "这是引导页"
        label.font = .boldSystemFont(ofSize: 13)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("跳过", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
    }
    
    @objc private func buttonClicked() {
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = CQTabBarController()
        }
    }
    
    deinit {
        print("引导页释放")
    }

}
