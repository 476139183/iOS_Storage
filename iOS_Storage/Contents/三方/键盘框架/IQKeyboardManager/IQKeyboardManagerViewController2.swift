//
//  IQKeyboardManagerViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/23.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class IQKeyboardManagerViewController2: CQBaseViewController {

    private let blueTextField = UITextField()
    private let redTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "已开启IQKeyboardManager"
        
        view.addSubview(blueTextField)
        blueTextField.placeholder = "请输入"
        blueTextField.backgroundColor = .blue
        blueTextField.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.right.equalTo(-90)
            make.bottom.equalTo(-200)
            make.height.equalTo(40)
        }
        
        view.addSubview(redTextField)
        redTextField.placeholder = "请输入"
        redTextField.backgroundColor = .red
        redTextField.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.right.equalTo(-90)
            make.bottom.equalTo(-100)
            make.height.equalTo(40)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        IQKeyboardManager.shared.enable = true
        
        // 禁用它的工具栏
        //IQKeyboardManager.shared.enableAutoToolbar = false
        
        IQKeyboardManager.shared.toolbarBarTintColor = .red
        IQKeyboardManager.shared.toolbarTintColor = .green
        IQKeyboardManager.shared.placeholderButtonColor = .blue
        IQKeyboardManager.shared.placeholderColor = .orange
        
        UITextField.appearance().tintColor = .black // 光标颜色
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        IQKeyboardManager.shared.enable = false
    }

}
