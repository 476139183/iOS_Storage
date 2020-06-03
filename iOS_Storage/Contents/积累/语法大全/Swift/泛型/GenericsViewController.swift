//
//  GenericsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let arr = [1, 2, 3, 3.3]
        
        var a = 1
        var b = 2
        
        swapTwoValue(&a, &b)
        
        print(a, b)
        
    }
    
    private func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
        let c = a
        a = b
        b = c
    }

}
