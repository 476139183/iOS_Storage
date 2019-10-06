//
//  EasyButtonViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class EasyButtonViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let cqButton = EasyButton.init(image: UIImage.init(named: "jia")!, title: "左边画条龙", font: .systemFont(ofSize: 16), titleColor: .black)
        view.addSubview(cqButton)
        cqButton.layer.cornerRadius = 5
        cqButton.backgroundColor = .orange
        cqButton.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        cqButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
            make.height.equalTo(30)
        }
        cqButton.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        cqButton.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(cqButton.imageView.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
        
        
        // OC版本
        let myButton = CQEasyButton.init(image: UIImage.init(named: "jia")!, title: "右边画彩虹", font: .boldSystemFont(ofSize: 14), titleColor: .red)
        view.addSubview(myButton)
        myButton.backgroundColor = .yellow
        myButton.layer.cornerRadius = 10
        myButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        myButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        myButton.imageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.size.equalTo(CGSize.init(width: 20, height: 20))
        }
        myButton.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
            make.right.equalTo(myButton.imageView.snp.left).offset(-5)
        }
    }
    
    
    @objc private func leftButtonClicked() {
        print("left click")
    }
    
    @objc private func rightButtonClicked() {
        print("right click")
    }
    
}
