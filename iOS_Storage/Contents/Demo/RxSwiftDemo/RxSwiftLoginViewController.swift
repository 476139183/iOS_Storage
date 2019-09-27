//
//  RxSwiftLoginViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class RxSwiftLoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameInvalidLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordInvalidLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let usernameValid = usernameTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count >= 6
        }
        
        usernameValid.bind(to: usernameInvalidLabel.rx.isHidden)
        usernameValid.bind(to: passwordTextField.rx.isEnabled)
        
        
        let passwordValid = passwordTextField.rx.text.orEmpty.map { (text) -> Bool in
            return text.count >= 6
        }
        
        passwordValid.bind(to: passwordInvalidLabel.rx.isHidden)
        
        Observable.combineLatest(usernameValid, passwordValid) { $0 && $1}
        .bind(to: loginButton.rx.isEnabled)
        .disposed(by: rx.disposeBag)
        
        
        loginButton.rx.tap.subscribe(onNext: { () in
            SVProgressHUD.showSuccess(withStatus: "登录")
        }).disposed(by: rx.disposeBag)
    }
    
}
