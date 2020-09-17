//
//  UITextFieldDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UITextFieldDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "监听回车键点击", targetVC: MonitorReturnKeyViewController()),
                          ItemModel(title: "监听输入内容变化", targetVC: MonitorTextFieldViewController()),
                          ItemModel(title: "限制输入长度", targetVC: MaxLengthTextfieldViewController()),
                          ItemModel(title: "带警示效果的textField", targetVC: CQWarnTextFieldController()),
                          ItemModel(title: "344格式的textField", targetVC: Phone344FormatViewController())]
        
    }

}
