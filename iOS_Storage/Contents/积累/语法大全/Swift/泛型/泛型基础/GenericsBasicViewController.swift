//
//  GenericsBasicViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsBasicViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let arr = [1, 2, 3, 3.3]
        print(arr)
        
        var a = 1
        var b = 2
        
        swapTwoValue(&a, &b)
        
        print(a, b)
        
    }

}


// MARK: - 交换两个值

extension GenericsBasicViewController {
    
    private func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
        let c = a
        a = b
        b = c
    }
    
}


// MARK: - 扩展泛型类型

// Swift 的 Array 就是一个泛型类型
extension Array {
    
    func secondValur() -> Any {
        return self[1]
    }
    
}


// MARK: - 类型约束

// 类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。

