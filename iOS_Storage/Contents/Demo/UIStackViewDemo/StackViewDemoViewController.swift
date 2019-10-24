//
//  StackViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StackViewDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        
        
        let stackView = UIStackView.init(arrangedSubviews: [redView, greenView, blueView])
        view.addSubview(stackView)
        stackView.spacing = 30
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .equalSpacing
        
        // 不设置宽度，让它宽度自适应
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }

}
