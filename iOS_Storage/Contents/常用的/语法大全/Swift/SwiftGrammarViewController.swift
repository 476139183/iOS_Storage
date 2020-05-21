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
        
        self.dataArray = [ItemModel(title: "getter与setter", targetVC: GetterSetterViewController()),
                          ItemModel(title: "class与struct", targetVC: ClassAndStructViewController()),
                          ItemModel(title: "String", targetVC: StringPracticeViewController()),
                          ItemModel(title: "Array", targetVC: ArrayPracticeViewController()),
                          ItemModel(title: "Dict", targetVC: DictPracticeViewController()),
                          ItemModel(title: "Number", targetVC: NumPracticeViewController()),
                          ItemModel(title: "Date", targetVC: DatePracticeViewController()),
                          ItemModel(title: "Data", targetVC: DataPracticeViewController()),
                          ItemModel(title: "流程控制", targetVC: ControlFlowViewConroller()),
                          ItemModel(title: "枚举", targetVC: EnumPracticeViewController())]
        
    }
    
}
