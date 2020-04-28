//
//  PinchGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PinchGestureViewController: CQBaseViewController {
    
    let blueLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "捏合手势"
        
        view.addSubview(blueLable)
        blueLable.backgroundColor = .blue
        blueLable.text = "缩放"
        blueLable.textAlignment = .center
        blueLable.isUserInteractionEnabled = true
//        blueLable.size = .init(width: 200, height: 200)
//        blueLable.center = view.center
        // 可以用自动布局
        blueLable.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        let gesture = UIPinchGestureRecognizer.init(target: self, action: #selector(viewPinched(sender:)))
        blueLable.addGestureRecognizer(gesture)
        
    }
    
    @objc private func viewPinched(sender: UIPinchGestureRecognizer) {
        //每次缩放以上一次为标准
        sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
        //重新设置缩放比例 1是正常缩放.小于1时是缩小(无论何种操作都是缩小),大于1时是放大(无论何种操作都是放大)
        sender.scale = 1
    }

}
