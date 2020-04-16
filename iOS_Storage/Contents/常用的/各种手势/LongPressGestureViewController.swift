//
//  LongPressGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class LongPressGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let blueLabel = UILabel()
        view.addSubview(blueLabel)
        blueLabel.backgroundColor = .blue
        blueLabel.isUserInteractionEnabled = true
        blueLabel.textAlignment = .center
        blueLabel.text = "长按变颜色"
        blueLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        let longPressGesture = UILongPressGestureRecognizer.init(target: self, action: #selector(viewLongPressed(gesture:)))
        longPressGesture.minimumPressDuration = 2 // 最小长按时间
        blueLabel.addGestureRecognizer(longPressGesture)
        
    }
    
    @objc private func viewLongPressed(gesture: UILongPressGestureRecognizer) {
        // 进行判断，在什么时候触发事件
        if gesture.state == UIGestureRecognizer.State.began {
            print("长按")
            gesture.view?.backgroundColor = .red
        }
    }

}
