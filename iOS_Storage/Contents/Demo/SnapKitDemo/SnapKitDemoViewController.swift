//
//  SnapKitDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/2.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class SnapKitDemoViewController: CQBaseViewController {
    
    private let redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.centerX.equalTo(100)
            make.top.equalTo(100)
            make.width.equalTo(100)
            // height : width = 2 : 1
            make.height.equalTo(redView.snp.width).multipliedBy(2)
        }
        
        
        // 优先让label2宽度自适应
        let label1 = UILabel()
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.text = "别扯我，宽度自适应"
        label1.backgroundColor = .yellow
        // 别扯我
        label1.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(300)
        }
        
        let label2 = UILabel()
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.text = "扯不动你"
        label2.backgroundColor = .orange
        view.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(label1)
            make.left.equalTo(label1.snp.right)
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testAnimation()
    }
    
    
    // MARK: - SnapKit动画
    
    func testAnimation() {
        self.redView.snp.updateConstraints { (make) in
            make.centerX.equalTo(200)
        }
        self.redView.needsUpdateConstraints()
        self.redView.updateConstraintsIfNeeded()
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded() // 注意父view调用layoutIfNeeded
        }
    }
    
}
