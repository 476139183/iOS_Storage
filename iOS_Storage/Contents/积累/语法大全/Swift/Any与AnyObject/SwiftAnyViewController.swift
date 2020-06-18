//
//  SwiftAnyViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftAnyViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let p1 = Person.init(name: "Jack")
        test1(a: p1 as AnyObject)
        
    }
    
    private func test1(a: AnyObject) {
        
    }

}

fileprivate struct Person {
    var name = ""
}
