//
//  QueueDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class QueueDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var queue = Queue<Int>()
        
        queue.enqueue(1)
        queue.enqueue(2)
        
        print(queue)
        
        queue.dequeue()
        
        print(queue)
        
    }

}
