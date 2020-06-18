//
//  SwiftOperatorViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftOperatorViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        checkIsIn()
        
    }

}


// MARK: - ~=

// 查看一个范围是否包含某个值

extension SwiftOperatorViewController {
    
    private func checkIsIn() {
        let range = (40...60)
        if range ~= 50 {
            print("is in")
        } else {
            print("not in")
        }
    }
    
}
