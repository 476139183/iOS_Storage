//
//  OOPViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/20.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class OOPViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let person = Person(name: "Jack", age: 22)
        
        print(person.name)
        
    }

}


fileprivate class Person {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}
