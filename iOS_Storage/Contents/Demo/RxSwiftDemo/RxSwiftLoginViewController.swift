//
//  RxSwiftLoginViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class RxSwiftLoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var usernameInvalidLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordInvalidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        print("login")
    }
    
}
