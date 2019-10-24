//
//  ArrayPracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ArrayPracticeViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 数组拼接
        let arr1 = [1, 2, 3]
        let arr2 = [4, 5, 6]
        let arr3 = arr1 + arr2 // arr3 的值是：1 2 3 4 5 6
        print(arr3)
    }

}
