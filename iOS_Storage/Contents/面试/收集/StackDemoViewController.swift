//
//  StackDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/23.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StackDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var stack = Stack<Any>()
        
        stack.push(233)
        stack.push("套你猴子")
        stack.push(false)
        
        stack.enumerateFromBottom { (item) in
            print(item)
        }
        
        print("========")
        
        stack.enumerateFromTop { (item) in
            print(item)
        }
        
        print(stack)
        stack.clear()
        print(stack)
        
    }

}


struct Stack<Element> {
    
    // 容器
    private var array: [Element] = []
    
    /// 入栈
    mutating func push(_ item: Element) {
        array.append(item)
    }
    
    /// 出栈
    mutating func pop() {
        if array.count >= 1 {
            array.removeLast()
        }
    }
    
    /// 是否为空
    var isEmpty: Bool {
        array.count == 0
    }
    
    /// 栈的长度
    var length: Int {
        array.count
    }
    
    /// 返回栈顶元素
    var top: Element? {
        array.last
    }
    
    /// 返回栈底元素
    var bottom: Element? {
        array.first
    }
    
    /// 从顶部开始遍历
    func enumerateFromTop(closure: (Element) -> ()) {
        array.reversed().forEach { (item) in
            closure(item)
        }
    }
    
    /// 从底部开始遍历
    func enumerateFromBottom(closure: (Element) -> ()) {
        array.forEach { (item) in
            closure(item)
        }
    }
    
    /// 清空
    mutating func clear() {
        array.removeAll()
    }
    
}

