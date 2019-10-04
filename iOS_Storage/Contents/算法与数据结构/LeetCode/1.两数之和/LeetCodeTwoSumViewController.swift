//
//  LeetCodeTwoSumViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeetCodeTwoSumViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let array = [3, 3]
        let target = 6
        
        print(twoSum(array, target))
    }
    
    
    // MARK: - 两数之和
    // 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
    //
    // 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
    // [3, 3] 6
    @objc func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int : Int] = [:]
        for i in 0..<nums.count {
            dict[nums[i]] = i
        }
        
        // dict[3] = 1
        
        for i in 0..<nums.count {
            let last = target - nums[i]
            if let j = dict[last], i != j {
                return [i, j]
            }
        }
        return []
    }
    
}
