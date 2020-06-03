//
//  ClassAndStructViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ClassAndStructViewController: CQBaseViewController {
    
    private let structPerson = StructPerson.init(name: "jack")
    private let classPerson = ClassPerson.init(name: "ben")
    
    private lazy var structArray: [StructPerson] = {
        return [StructPerson.init(name: "jack1")]
    }()
    
    private lazy var classArray: [ClassPerson] = {
        return [ClassPerson.init(name: "ben1")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var p = self.structPerson
        p.name = "111"
        
        let p2 = self.classPerson
        p2.name = "222"
        
        print(self.structPerson.name) // 打印jack  struct 是值传递
        print(self.classPerson.name)  // 打印 222 class 是引用传递
        
        var pp1 = structArray.first
        pp1?.name = "嘿嘿1"
        print(structArray.first?.name) // 打印 jack1
        
        let pp2 = classArray.first
        pp2?.name = "嘿嘿2"
        print(classArray.first?.name)  // 打印 嘿嘿2
    }

}

fileprivate struct StructPerson {
    var name: String
    var age: Int? = 0
}

fileprivate class ClassPerson {
    var name: String
    init(name: String) {
        self.name = name
    }
}
