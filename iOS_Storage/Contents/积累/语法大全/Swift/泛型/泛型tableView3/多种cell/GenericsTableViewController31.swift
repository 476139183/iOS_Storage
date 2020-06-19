//
//  GenericsTableViewController31.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/19.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsTableViewController31: BaseGenericsTableViewController3<AnimalModel, AnimalCell, String, AnimalHeader> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let headerModel1 = "猫"
        let cellModel1 = AnimalModel.init(type: .cat, name: "橘猫")
        let cellModel2 = AnimalModel.init(type: .cat, name: "蓝猫")
        
        let headerModel2 = "狗"
        let cellModel3 = AnimalModel.init(type: .dog, name: "秋田")
        let cellModel4 = AnimalModel.init(type: .dog, name: "土狗")
        
        let section1 = SectionModel.init(headerModel: headerModel1, cellModels: [cellModel1, cellModel2])
        let section2 = SectionModel.init(headerModel: headerModel2, cellModels: [cellModel3, cellModel4])
        
        self.dataArray = [section1, section2]
        
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 40
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
}
