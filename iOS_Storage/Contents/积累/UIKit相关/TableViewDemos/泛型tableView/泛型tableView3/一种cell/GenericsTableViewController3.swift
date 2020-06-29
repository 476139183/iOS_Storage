//
//  GenericsTableViewController3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsTableViewController3: BaseGenericsTableViewController3<ShoeModel, ShoeCell, ShoeHeaderModel, ShoeHeader, String, ShoeFooter> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let headerModel1 = ShoeHeaderModel.init(title: "AJ")
        let footerModel1 = "more"
        let cellModel1 = ShoeModel.init(name: "AJ1", image: "AJ1")
        let cellModel2 = ShoeModel.init(name: "AJ5", image: "AJ5")
        
        let headerModel2 = ShoeHeaderModel.init(title: "yeezy")
        let footerModel2 = "more"
        let cellModel3 = ShoeModel.init(name: "满天星", image: "满天星")
        let cellModel4 = ShoeModel.init(name: "白斑马", image: "白斑马")
        
        let section1 = SectionModel.init(headerModel: headerModel1, footerModel: footerModel1, cellModels: [cellModel1, cellModel2])
        let section2 = SectionModel.init(headerModel: headerModel2, footerModel: footerModel2, cellModels: [cellModel3, cellModel4])
        
        self.dataArray = [section1, section2]
        
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 40
        tableView.sectionFooterHeight = 30
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
}
