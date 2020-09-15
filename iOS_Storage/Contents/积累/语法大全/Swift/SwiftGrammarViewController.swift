//
//  SwiftGrammarViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftGrammarViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "class与struct", targetVC: ClassAndStructViewController()),
                          ItemModel(title: "Swift操作符", targetVC: SwiftOperatorViewController()),
                          ItemModel(title: "init与deinit", targetVC: SwiftInitViewController()),
                          ItemModel(title: "getter与setter", targetVC: GetterSetterViewController()),
                          ItemModel(title: "Any与AnyObject", targetVC: SwiftAnyViewController()),
                          ItemModel(title: "异常处理", targetVC: ErrorHandleViewController()),
                          ItemModel(title: "String", targetVC: StringPracticeViewController()),
                          ItemModel(title: "Array", targetVC: ArrayPracticeViewController()),
                          ItemModel(title: "Set", targetVC: SetDemoViewController()),
                          ItemModel(title: "Dict", targetVC: DictPracticeViewController()),
                          ItemModel(title: "Number", targetVC: NumPracticeViewController()),
                          ItemModel(title: "Date", targetVC: DatePracticeViewController()),
                          ItemModel(title: "Data", targetVC: DataPracticeViewController()),
                          ItemModel(title: "流程控制", targetVC: ControlFlowViewConroller()),
                          ItemModel(title: "枚举", targetVC: EnumPracticeViewController()),
                          ItemModel(title: "扩展", targetVC: SwiftExtensionViewController()),
                          ItemModel(title: "协议", targetVC: SwiftProtocolViewController()),
                          ItemModel(title: "泛型", targetVC: GenericsViewController()),
                          ItemModel(title: "闭包", targetVC: ClosureDemoViewController()),
                          ItemModel(title: "Codable", targetVC: CodableDemoViewController()),
                          ItemModel(title: "Swift Method Swizzling", targetVC: SwiftMethodSwizzlingViewController())]
        
    }
    
}
