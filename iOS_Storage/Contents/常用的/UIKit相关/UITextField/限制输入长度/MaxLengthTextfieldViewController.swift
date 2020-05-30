//
//  MaxLengthTextfieldViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MaxLengthTextfieldViewController: CQBaseViewController, UITextFieldDelegate {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.maxLength = 333 // 这个属性不好用
        textField.backgroundColor = .orange
        textField.delegate = self
        textField.autocorrectionType = .no
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(40)
        }
        
    }
    
    // MARK: - UITextField Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 12
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

}
