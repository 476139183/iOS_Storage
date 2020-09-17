//
//  Phone344FormatViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class Phone344FormatViewController: CQBaseViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        // 类似 134-8224-3257
        phoneTextField.text = phoneTextField.text?.phone344Formate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(phoneTextField.text?.phoneNormalFormate() ?? "")
    }
    
}
