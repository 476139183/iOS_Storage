//
//  ObserPropertyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ObserPropertyViewController: CQBaseViewController {
    
    private lazy var redView: MyView = {
        let view = MyView()
        view.backgroundColor = .red
        view.addObserver(self, forKeyPath: "backgroundColor", options: .new, context: nil)
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.top.equalTo(redView.snp.bottom).offset(30)
        }
        
        let hideButton = UIButton(type: .system)
        view.addSubview(hideButton)
        hideButton.setTitle("隐藏 | 显示", for: .normal)
        hideButton.addTarget(self, action: #selector(hideButtonClicked), for: .touchUpInside)
        hideButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
    }
    
    @objc private func hideButtonClicked() {
        redView.backgroundColor = .orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 手动触发KVO
        textField.text = "呵呵哒"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        print("changed")
        
//        if object == self.redView
//
//
//        if object as AnyObject? === self.redView {
//            print("redView change")
//        }
//        if object as AnyObject? === textField {
//            print("textField change")
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
}


fileprivate class MyView: UIView {
    
    // 是否自动触发
//    override class func automaticallyNotifiesObservers(forKey key: String) -> Bool {
//        return key == "isHidden"
//    }
    
}
