//
//  KingfisherLoadImageViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class KingfisherLoadImageViewController: CQBaseViewController {
    
//    private lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//
//        return imageView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 适用于不需要暴露出去的组合控件
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage.init(named: "iu")
            imageView.kf.setImage(with: URL.init(string: "ss"))
            return imageView
        }()
        
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
    }

}
