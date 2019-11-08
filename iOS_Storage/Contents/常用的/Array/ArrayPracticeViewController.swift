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
        
        // 创建
        var array: [Int] = [Int](repeatElement(1, count: 3))
        print(array) // 打印 [1, 1, 1]
        
        // 修改数组
        array.append(2)
        array += [3]
        print(array) // 打印 [1, 1, 1, 2, 3]
        
        // 遍历数组
        for item in array {
            print(array[item])
        }
        
        // 有索引值的遍历
        for (index, item) in array.enumerated() {
            print("第\(index)个是\(item)")
        }
        
        // 是否为空数组
        array.removeAll()
        if array.isEmpty {
            print("是空数组")
        }
        
        // 数组拼接
        let arr1 = [1, 2, 3]
        let arr2 = [4, 5, 6]
        let arr3 = arr1 + arr2 // arr3 的值是：1 2 3 4 5 6
        print(arr3)
        
        // 排序
        let arr4 = arr3.sorted { (item1, item2) -> Bool in
            return item1 > item2 // 从大到小排序
        }
        print(arr4)
        
    }
    
    // MARK: - Map（映射）
    private func testArrayMap() {
        let arr1 = [1, 2, 3, 4, 5]
        let arr2 = arr1.map { (num) -> Int in
            return num + 2
        }
        print(arr2) // 打印 [3, 4, 5, 6, 7]
    }
    
    // MARK: - FlatMap（空值过滤，强制降维）
    
    private func testFlatMap1() {
        // 空值过滤
        let arr1: [Int?] = [1, 2, 3, nil]
        let noNilArray = arr1.flatMap{ $0 }
        print(noNilArray) // 打印 [1, 2, 3]
        
        // 强制压平、强制降维
        let arr2 = [[1, 2, 3], [8]]
        let flatArray = arr2.flatMap{ $0 }
        print(flatArray) // 打印 [1, 2, 3, 8]
    }
    
    // MARK: - reduce（累加）
    
    private func testReduce() {
        // 用于累加
        let numbers = [1, 2, 3, 4]
        let numberSum = numbers.reduce(0) { (x, y) -> Int in
            x + y
        }
        print(numberSum)
    }
    
    // MARK: - filter（过滤）
    
    private func testFilter() {
        let arr = [-1, 1, 2, 3]
        let arr2 = arr.filter { (num) -> Bool in
            return num > 1
        }
        print(arr2)
    }
    
    // MARK: - touch began
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testFilter()
    }
    
}
