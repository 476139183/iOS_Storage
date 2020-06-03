//
//  ControlFlowViewConroller.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ControlFlowViewConroller: CQBaseViewController {
    
    var structModel: StructModel?
    var classModel: ClassModel?
    
    var isTrue: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        structModel = StructModel()
        structModel?.name = "struct1"
        
        classModel = ClassModel()
        classModel?.name = "class1"
        
        print(self.structModel?.name)
        print(self.classModel?.name)
        
        if isTrue {
            print("true")
        } else {
            print("not true")
        }
        
        
        
//        if let isTrue = isTrue {
//            print("有值")
//        } else {
//            print("没值")
//        }
//
//        if let isTrue = isTrue, isTrue == true {
//            print("ture")
//        } else {
//            print("not true")
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var structModel = self.structModel else {
            return
        }
        guard var classModel = self.classModel else {
            return
        }
        structModel.name = "struct2"
        classModel.name = "class2"
        
        print(self.structModel?.name)
        print(self.classModel?.name)
    }
    
}

struct StructModel {
    
    var name: String = ""
    
}

class ClassModel {
    
    var name: String = ""
    
}
