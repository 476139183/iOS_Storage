//
//  DelegateTransferViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class DelegateTransferViewController: CQBaseViewController, MyRedViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let orangeView = OrangeView()
        view.addSubview(orangeView)
        orangeView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
    }
    
    func redView(redView: MyRedView, leftButtonClicked: UIButton) {
        print("left button clicked")
    }
    
    func redView(redView: MyRedView, rightButtonClicked: UIButton) {
        print("right button clicked")
    }
    
}


// MARK: -

fileprivate class OrangeView: UIView {
    
    private lazy var redView: MyRedView = {
        let redView = MyRedView()
        return redView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
        
        addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 50, left: 50, bottom: 50, right: 50))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: -

@objc protocol MyRedViewDelegate {
    
    // 左边按钮点击回调
    func redView(redView: MyRedView, leftButtonClicked: UIButton)
    // 右边按钮点击回调
    func redView(redView: MyRedView, rightButtonClicked: UIButton)
    
}

class MyRedView: UIView {
    
    weak var delegate: MyRedViewDelegate? {
        get {
            return self.getLatestResponderConformsToProtocol(targetProtocol: MyRedViewDelegate.self) as? MyRedViewDelegate
        }
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.delegate = self.getLatestResponderConformsToProtocol(targetProtocol: MyRedViewDelegate.self) as? MyRedViewDelegate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lazy
    
    private lazy var leftButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("left", for: .normal)
        button.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("right", for: .normal)
        button.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - UI
    
    private func setupUI() {
        
        backgroundColor = .red
        
        addSubview(leftButton)
        addSubview(rightButton)
        
        leftButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.left.equalToSuperview()
            make.right.equalTo(self.snp.centerX)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.centerY.right.equalToSuperview()
            make.height.equalTo(20)
            make.left.equalTo(self.snp.centerX)
        }
        
    }
    
    
    // MARK: - Action
    
    @objc private func leftButtonClicked() {
        self.delegate?.redView(redView: self, leftButtonClicked: leftButton)
    }
    
    @objc private func rightButtonClicked() {
        self.delegate?.redView(redView: self, rightButtonClicked: rightButton)
    }
    
}


//fileprivate class BlueView: MyRedView {
//
//    override var delegate: MyRedViewDelegate? {
//        return self as? MyRedViewDelegate
//    }
//
//}
