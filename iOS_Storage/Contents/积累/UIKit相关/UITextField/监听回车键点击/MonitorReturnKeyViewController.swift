//
//  MonitorReturnKeyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MonitorReturnKeyViewController: CQBaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("点击了回车键")
        return true
    }

}
