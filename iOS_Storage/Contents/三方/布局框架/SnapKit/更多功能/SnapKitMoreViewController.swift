//
//  SnapKitMoreViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SnapKitMoreViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let redView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            self.view.addSubview(view)
            view.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                // MARK: - size 的简洁写法
                make.size.equalTo(100) // 宽高都是60
            }
            return view
        }()
        
        let greenView: UIView = {
            let view = UIView()
            view.backgroundColor = .green
            redView.addSubview(view)
            view.snp.makeConstraints { (make) in
                // MARK: - 上 左 下 右
                make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10))
            }
            return view
        }()
        
        let blueView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            self.view.addSubview(view)
            view.snp.makeConstraints { (make) in
                make.left.equalTo(20)
                make.right.equalTo(-20)
                // MARK: - Debug: 查看哪个约束出了问题
                make.width.equalTo(1000).labeled("blueView width")
                make.top.equalTo(90)
                make.height.equalTo(30)
            }
            return view
        }()
        
    }

}
