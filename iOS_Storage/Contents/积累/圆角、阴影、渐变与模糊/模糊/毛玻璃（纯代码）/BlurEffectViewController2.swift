//
//  BlurEffectViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BlurEffectViewController2: CQBaseViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "iu")
        return imageView
    }()
    // 高斯模糊
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        view.addSubview(blurEffectView)
        
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        blurEffectView.snp.makeConstraints { (make) in
            make.edges.equalTo(imageView)
        }
        
    }
    
    

}
