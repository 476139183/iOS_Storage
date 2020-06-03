//
//  GrammarListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GrammarListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "C", targetVC: CGrammarViewController()),
                          ItemModel.init(title: "C++", targetVC: CPlusGrammarViewController()),
                          ItemModel.init(title: "Objective-C", targetVC: OCGrammarViewController()),
                          ItemModel.init(title: "Swift", targetVC: SwiftGrammarViewController())]
        
    }

}
