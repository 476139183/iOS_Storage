//
//  URLToQRCodeController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class URLToQRCodeController: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton.init(type: .system)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.setTitle("点击生成二维码", for: .normal)
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
    }
    
    @objc private func buttonClicked() {
        imageView.image = URLToQRCodeTool.createrImage(withURLString: "https://detail.m.tmall.com/item.htm?id=564086600656", imageWidth: 100)
    }
    
}
