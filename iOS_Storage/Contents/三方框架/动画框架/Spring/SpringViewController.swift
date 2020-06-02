//
//  SpringViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Spring

class SpringViewController: CQBaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "iu")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}
