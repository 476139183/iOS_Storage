//
//  LinkedListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LinkedListViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }

}

/// 结点
fileprivate class ListNode<T> {
    
    // 值
    var value: T
    // 前驱
    var previous: ListNode?
    // 后继
    var next: ListNode?
    
    init(_ value: T) {
        self.value = value
    }
    
}


/// 单链表
fileprivate class SinglyLinkedList<T> {
    typealias Node = ListNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var firstNode: Node? {
        return head
    }
    
    var lastNode: Node? {
        return tail
    }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(_ value: T) {
        let newNode = Node.init(value)
        
        if isEmpty {
            head = newNode
        } else {
            
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
}
