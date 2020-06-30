//
//  GenericsOnlyCellTableControllerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsOnlyCellTableControllerViewController: BaseGenericsTableViewController3<ShoeModel, ShoeCell, DefaultTableHeaderModel, DefaultTableHeader, DefaultTableFooterModel, DefaultTableFooter> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.rowHeight = 100
        
        
        let cellModel1 = ShoeModel(name: "AJ1", image: "AJ1")
        let cellModel2 = ShoeModel(name: "AJ5", image: "AJ5")
        
        dataArray = [SectionModel(cellModels: [cellModel1, cellModel2])]
        
    }

}
