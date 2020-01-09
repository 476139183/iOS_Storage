//
//  GetterSetterViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GetterSetterViewController: CQBaseViewController {
    
    var name: String? {
        didSet {
            guard var name = self.name else {
                return
            }
            // 以下代码都不会存在循环调用setter
            self.name?.append("呵呵")
            self.name = "Mary"
            print("self.name==\(self.name),name==\(name)")
        }
    }
    
    var age: Int? {
        get {
            return 10
        }
        set {
            print("set age")
        }
    }
    
    //    var age: Int = 0 {
    //        var volume: Double {
    //            return width * height * depth
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.name = "Jack"
        
    }
    
}
