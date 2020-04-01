//
//  HeroViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Hero

class HeroViewController2: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "iu")
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(imageViewTaped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.hero.id = "iu"
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
    }
    
    @objc private func imageViewTaped() {
        dismiss(animated: true, completion: nil)
    }

}
