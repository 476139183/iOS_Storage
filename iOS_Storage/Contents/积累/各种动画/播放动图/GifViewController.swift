//
//  GifViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/2.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Kingfisher

class GifViewController: CQBaseViewController {
    
    private lazy var imageView2: UIImageView = {
        let imageView = UIImageView()
        let path = Bundle.main.url(forResource: "yeezy_loading", withExtension: "gif")
        let resource = LocalFileImageDataProvider(fileURL: path!)
        imageView.kf.setImage(with: resource)
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        
        view.addSubview(imageView2)
        imageView2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(300)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
    }

}
