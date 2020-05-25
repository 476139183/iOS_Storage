//
//  RxSwiftAddHiddenViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IQKeyboardManagerSwift

class RxSwiftAddHiddenViewController: CQBaseViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.placeholder = "字数不能少于5"
        return textField
    }()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var showRedViewButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("点击显示or隐藏redView", for: .normal)
        button.addTarget(self, action: #selector(showRedViewButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var checkButton: MyButton = {
        let button = MyButton()
        button.backgroundColor = .blue
        button.setTitle("可以点", for: .normal)
        button.setTitle("不可点", for: .disabled)
        button.rx.tap.subscribe(onNext: { () in
            print("点点点")
        }).disposed(by: self.disposeBag)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        view.addSubview(showRedViewButton)
        showRedViewButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.top.equalTo(showRedViewButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        view.addSubview(checkButton)
        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(redView.snp.bottom).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        
        // textField文本>=5，并且redView显示时，按钮可以点击
        
        let textValid = textField.rx.text.orEmpty.asObservable().map { (text) -> Bool in
            return text.count >= 5
        }
        
        let redViewValid = redView.rx.hidden.asObservable().map { (isHidden) -> Bool in
            return !isHidden
        }
        
        Observable.combineLatest(textValid, redViewValid) { $0 && $1}.bind(to: checkButton.rx.isEnabled)
        .disposed(by: self.disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    @objc private func showRedViewButtonClicked() {
        redView.isHidden = !redView.isHidden
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}


fileprivate class MyButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .blue
            } else {
                backgroundColor = .gray
            }
        }
    }
    
}
