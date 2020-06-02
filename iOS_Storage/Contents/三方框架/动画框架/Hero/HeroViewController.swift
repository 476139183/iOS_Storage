//
//  HeroViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/3/31.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Hero

class HeroViewController: CQBaseViewController {
    
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
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        
    }
    
    @objc private func imageViewTaped() {
        let vc = HeroViewController2()
        vc.hero.isEnabled = true // 开启转场动画，建议在present或push前调用
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }

}
