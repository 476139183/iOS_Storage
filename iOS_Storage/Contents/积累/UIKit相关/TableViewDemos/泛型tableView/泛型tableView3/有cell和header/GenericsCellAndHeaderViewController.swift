//
//  GenericsCellAndHeaderViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsCellAndHeaderViewController: BaseGenericsTableViewController3<ShoeModel, ShoeCell, ShoeHeaderModel, ShoeHeader, Any, BaseFooter3<Any>> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let headerModel1 = ShoeHeaderModel.init(title: "AJ")
        let cellModel1 = ShoeModel.init(name: "AJ1", image: "AJ1")
        let cellModel2 = ShoeModel.init(name: "AJ5", image: "AJ5")
        
        let headerModel2 = ShoeHeaderModel.init(title: "yeezy")
        let cellModel3 = ShoeModel.init(name: "满天星", image: "满天星")
        let cellModel4 = ShoeModel.init(name: "白斑马", image: "白斑马")
        
        let section1 = SectionModel<ShoeHeaderModel, Any, ShoeModel>.init(headerModel: headerModel1, cellModels: [cellModel1, cellModel2])
        let section2 = SectionModel<ShoeHeaderModel, Any, ShoeModel>.init(headerModel: headerModel2, cellModels: [cellModel3, cellModel4])
        
        self.dataArray = [section1, section2]
        
        self.tableView.rowHeight = 100
        self.tableView.sectionHeaderHeight = 40
        
    }

}
