//
//  IconFontViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/9.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class IconFontViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let label = UILabel()
        view.addSubview(label)
        label.text = IconFont.close
        label.font = IconFont.font(size: 16)
        label.textColor = .gray
        label.frame = CGRect(x: 90, y: 90, width: 90, height: 90)
        
        let button = IconFontButton()
        view.addSubview(button)
        button.backgroundColor = .red
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        button.set(icon: "", iconFontSize: 0, text: "返回", textFont: .boldSystemFont(ofSize: 12), buttonTitleColor: .black, spacing: 0)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc private func buttonClicked() {
        print("click")
    }
    
}
