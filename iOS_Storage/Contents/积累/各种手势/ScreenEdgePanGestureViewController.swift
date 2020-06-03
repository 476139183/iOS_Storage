//
//  ScreenEdgePanGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ScreenEdgePanGestureViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "屏幕边缘手势"
        
        view.backgroundColor = .orange
        
        let label = UILabel()
        view.addSubview(label)
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "滑右边缘可以返回上一页"
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        //注意:,使用屏幕边界平移手势,需要注意两点
        //1. 视图位置(屏幕边缘)
        //2. 设置edges属性
         // 设置屏幕边缘手势支持方法
        let gesture = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(screenEdgePanView(sender:)))
        gesture.edges = [.right]
        self.view.addGestureRecognizer(gesture)
        
    }
    
    @objc private func screenEdgePanView(sender: UIScreenEdgePanGestureRecognizer) {
        print("滑滑滑")
        // 返回上一页
        navigationController?.popViewController(animated: true)
    }

}
