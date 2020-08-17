//
//  UserDefaultsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UserDefaultsViewController: CQBaseViewController {
    
    let key = "UserDefaultsViewController_key"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UserDefaults.standard.set("sss", forKey: key)
        UserDefaults.standard.synchronize()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(UserDefaults.standard.value(forKey: key))
    }

}
