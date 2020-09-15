//
//  SwiftMethodSwizzlingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftMethodSwizzlingViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        test1()
    }
    
}

extension SwiftMethodSwizzlingViewController {
    
    dynamic func test1() {
        print("111")
    }

    @_dynamicReplacement(for: test1())
    func test2() {
        print("222")
    }
    
}
