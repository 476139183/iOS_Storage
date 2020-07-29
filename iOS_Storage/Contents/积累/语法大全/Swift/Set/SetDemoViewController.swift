//
//  SetDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SetDemoViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let array1 = [1, 2, 3]
        let array2 = [2, 3, 1]
        
        let set1 = Set(array1)
        let set2 = Set(array2)
        
        if set1 == set2 {
            print("contain")
        } else {
            print("not contain")
        }
    }
    
}
