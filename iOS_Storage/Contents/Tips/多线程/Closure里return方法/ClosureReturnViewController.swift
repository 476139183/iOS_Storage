//
//  ClosureReturnViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ClosureReturnViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let a = returnInClosure()
        print(a)
        
    }
    
    private func returnInClosure() -> String {
        
        let queue = DispatchQueue.init(label: "myQueue")
        
        var objectID = ""
        
        let semaphore = DispatchSemaphore(value: 0)
        
        queue.asyncAfter(deadline: .now()+2) {
            objectID = "22"
            semaphore.signal()
        }
        
        semaphore.wait()
        
        return objectID;
    }
    
}
