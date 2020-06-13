//
//  ClosureDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ClosureDemoViewController: CQBaseViewController {
    
    // MARK: - 闭包做属性
    var selectedCityClosure: ((String) -> ())?
    
    // MARK: - 自定义
    typealias MyClosure = (() -> Void)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        selectedCityClosure?("cheng du")
        
        test(closure1: {
            
        }, closure2: { str in
            print(str)
        })
        
        test(closure1: {
            
        }) { (str) in
            
        }
        
        // MARK: - 破解尾随闭包
        test(closure1: {
            
        }, closure2: { str in
            print(str)
        })
        
    }
    
}

extension ClosureDemoViewController {
    
    
    // MARK: - 闭包做参数
    private func test(closure1: () -> Void, closure2: (String) -> Void) {
        
    }
    
    private func test1(closure1: () -> Void, closure2: () -> Void) {
        closure1()
        closure2()
    }
    
    private func test2(closure1: () -> Void, closure2: () -> Void, closure3: () -> Void) {
        
    }
    
}
