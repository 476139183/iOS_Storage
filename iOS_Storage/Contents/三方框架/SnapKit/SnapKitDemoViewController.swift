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
            make.width.equalTo(50)
            // MARK: - 宽高比
            // height : width = 2 : 1
            make.height.equalTo(redView.snp.width).multipliedBy(2)
        }
        
        
        // 优先让label2宽度自适应
        let label1 = UILabel()
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.text = "别扯我，宽度自适应"
        label1.backgroundColor = .yellow
        // MARK: - 别扯我
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
    
    
    // MARK: - 宽度自适应的 Button
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.titleLabel?.backgroundColor = .red
        button.imageView?.backgroundColor = .orange
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage.init(named: "location"), for: .normal)
        button.setTitle("title", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        return button
    }()
    private func testButton() {
        view.addSubview(myButton)
        myButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-80)
            make.height.equalTo(40)
        }
    }
    
    
    // MARK: - SnapKit动画
    
    private func testAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.redView.snp.updateConstraints { (make) in
                make.centerX.equalTo(200)
            }
            // 注意父view调用layoutIfNeeded
            self.redView.superview?.layoutIfNeeded()
        }
    }
    
    
}



extension SnapKitDemoViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testButton()
    }
    
}

fileprivate class CustomButton: UIButton {
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: 0, width: height, height: height)
    }
}
