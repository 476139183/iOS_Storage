//
//  LongImageViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LongImageViewController: CQBaseViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .orange
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apply")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            // 设置宽度，这一句是必须的
            make.width.equalTo(200)
            // 高 : 宽
            if let imageSize = imageView.image?.size {
                make.height.equalTo(imageView.snp.width).multipliedBy(imageSize.height / imageSize.width)
            }
        }
        
    }

}
