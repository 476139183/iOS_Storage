//
//  DictPracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/8.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class DictPracticeViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 创建
        var dict: [Int : String] = [1 : "One", 2 : "two"]
        
        // 访问
        var str = dict[1]
        
        // 修改
        dict.updateValue("二", forKey: 2)
        print(dict)
        // 也可以
        dict[2] = "好2"
        print(dict)
        
        // 移除键值对
        dict.removeValue(forKey: 2)
        print(dict)
        // 也可以通知指定键的值为nil来移除键值对
        dict[1] = nil
        print(dict)
        
        
        // 遍历字典
        dict[1] = "one"
        dict[2] = "two"
        for (key, value) in dict.enumerated() {
            print("key:\(key),键值对:\(value)")
        }
        
        
        // 转数组
        // key和value都可以转数组
        let arr1 = dict.keys
        let arr2 = dict.values
        print("keys:\(arr1),values:\(arr2)")
        
        
        // 有多少个键值对
        let count = dict.count
        print("count:\(count)")
        
        // 是否为空
        let isEmpty = dict.isEmpty
        print("isEmpty:\(isEmpty)")
    }

}
