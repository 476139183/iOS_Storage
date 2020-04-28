//
//  RotationGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class RotationGestureViewController: CQBaseViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "旋转手势"
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
        let rotationGesture = UIRotationGestureRecognizer.init(target: self, action: #selector(viewRotationed(sender:)))
        redView.addGestureRecognizer(rotationGesture)
        
    }
    
    @objc private func viewRotationed(sender: UIRotationGestureRecognizer) {
        //两个参数,以上位置为标准
        sender.view!.transform = sender.view!.transform.rotated(by: sender.rotation)
        //消除增量
        sender.rotation = 0.0
    }

}
