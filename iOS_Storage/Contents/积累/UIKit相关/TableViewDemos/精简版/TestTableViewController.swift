//
//  TestTableViewController.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import UIKit

class TestTableViewController: DemoTableViewController<TestTableViewCell, TestTableHeader, TestTableFooter> {
    private let cellModels = Array(repeating: TestTableCellModel(), count: 5)
    private let headerModel = TestTableHeaderModel()
    private let footerModel = TestTableFooterModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataArray = [
            TestSectionModel(cellModels: cellModels, headerModel: headerModel, footerModel: footerModel),
            TestSectionModel(cellModels: cellModels, headerModel: headerModel, footerModel: footerModel),
            TestSectionModel(cellModels: cellModels, headerModel: headerModel, footerModel: footerModel),
            TestSectionModel(cellModels: cellModels, headerModel: headerModel, footerModel: footerModel),
            TestSectionModel(cellModels: cellModels, headerModel: headerModel, footerModel: footerModel)
        ]
        
        tableView.sectionHeaderHeight = 50
        tableView.sectionFooterHeight = 50
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: String(describing: TestTableViewCell.self))
        tableView.register(TestTableHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: TestTableHeader.self))
        tableView.register(TestTableFooter.self, forHeaderFooterViewReuseIdentifier: String(describing: TestTableFooter.self))
    }

}
