//
//  GetterSetterViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GetterSetterViewController: CQBaseViewController {
    
    var name: String? {
        didSet {
            guard var name = self.name else {
                return
            }
            // 以下代码都不会存在循环调用setter
            self.name?.append("呵呵")
            self.name = "Mary"
            print("self.name==\(self.name),name==\(name)")
        }
    }
    
    var age: Int? {
        get {
            return 10
        }
        set {
            print("set age")
        }
    }
    
    //    var age: Int = 0 {
    //        var volume: Double {
    //            return width * height * depth
    //        }
    //    }
    
    private var classPersonArray: [ClassPerson] = [] {
        didSet {
            print("classPersonArray didSet")
        }
    }
    
    private var structPersonArray: [StructPerson] = [] {
        didSet {
            print("structPersonArray didSet")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.name = "Jack"
        
        let person1 = ClassPerson()
        person1.name = "person1"
        classPersonArray.append(person1)
        
        var person2 = StructPerson()
        person2.name = "person2"
        structPersonArray.append(person2)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 以下都不会触发 array 的 didset
        let classPerson = classPersonArray.first
        classPerson?.name = "2"
        
        var structPerson = structPersonArray.first
        structPerson?.name = "333"
        
        classPersonArray.first?.name = "555"
    }
    
}

fileprivate class ClassPerson {
    var name = ""
}

fileprivate struct StructPerson {
    var name = ""
}
