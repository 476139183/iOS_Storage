//
//  SwipeGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwipeGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "轻扫手势"
        
        let blueView = UIView()
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        let label = UILabel()
        blueView.addSubview(label)
        label.text = "两指向下扫"
        label.font = .systemFont(ofSize: 15)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        let swipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(viewSwiped(gesture:)))
        swipeGesture.numberOfTouchesRequired = 2 // 两指滑动
        swipeGesture.direction = .down // 向下的手势
        blueView.addGestureRecognizer(swipeGesture)
        
    }
    
    @objc private func viewSwiped(gesture: UISwipeGestureRecognizer) {
        print("扫扫扫")
        gesture.view?.backgroundColor = .red
    }
    
}
