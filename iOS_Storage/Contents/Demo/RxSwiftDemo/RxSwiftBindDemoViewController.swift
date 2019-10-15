//
//  RxSwiftBindDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftBindDemoViewController: CQBaseViewController {
    
    let disposeBag = DisposeBag()
    
    var array: [Int] = [1, 2, 3]
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("提交", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.backgroundColor = .blue
        button.isEnabled = false
        return button
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "title"
        textField.backgroundColor = .orange
        return textField
    }()
    
    private lazy var descTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "desc"
        textField.backgroundColor = UIColor.yellow
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("已读", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.green, for: .selected)
        button.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setupUI()
        
        // 当titleTextField和descTextField的字数大于5，并且确定按钮处于选中状态时，提交按钮才可以点击
        let titleValid = titleTextField.rx.text.orEmpty.asObservable().map { (text) -> Bool in
            return text.count >= 5
        }
        let descValid = descTextField.rx.text.orEmpty.asObservable().map { (text) -> Bool in
            return text.count >= 5
        }
        
        let selectedState = Variable(true)
        _ = selectedState.asObservable().bind(to: confirmButton.rx.isSelected)
        
//        let isConfirm = confirmButton.rx.isSelected.asObserver().mapObserver { (selected) -> Bool in
//            return selected
//        }
        
       
        
//        Observable.combineLatest(titleValid, descValid, selectedState) { $0 && $1 && $2 }.bind(to: submitButton.rx.isEnabled)
//            .disposed(by: self.disposeBag)
        
       
        
    }
    
    private func setupUI() {
        view.addSubview(submitButton)
        view.addSubview(titleTextField)
        view.addSubview(descTextField)
        view.addSubview(confirmButton)
        
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(submitButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        descTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        confirmButton.snp.makeConstraints { (make) in
            make.top.equalTo(descTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    @objc func confirmButtonClicked() {
        confirmButton.isSelected = !confirmButton.isSelected
    }
    
}
