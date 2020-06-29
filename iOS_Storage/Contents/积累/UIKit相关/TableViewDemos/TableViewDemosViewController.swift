//
//  TableViewDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TableViewDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "标准TableView OC版", targetVC: CQStandardOCTableViewViewController()),
                          ItemModel.init(title: "标准TableView Swift版", targetVC: StandardSwiftTableViewViewController()),
                          ItemModel.init(title: "索引TableView", targetVC: IndexTableViewController()),
                          ItemModel.init(title: "无规律TableView", targetVC: IrregularityViewController()),
                          ItemModel.init(title: "表头图片下拉放大的TableView", targetVC: PullDownLargeViewController()),
                          ItemModel.init(title: "修改组头悬停位置", targetVC: ChangeSectionHeaderPositionViewController()),
                          ItemModel.init(title: "静态TableView", targetVC: StaticViewController()),
                          ItemModel.init(title: "TableView预加载", targetVC: PreloadTableViewController()),
                          ItemModel.init(title: "同种Model多种cell的TableView", targetVC: SameModelTableViewController()),
                          ItemModel.init(title: "精简TableView", targetVC: SimpleTableViewController()),
                          ItemModel.init(title: "急速TableView", targetVC: QuickTableViewController()),
                          ItemModel.init(title: "TableView的各种操作", targetVC: HandleTableViewController()),
                          ItemModel.init(title: "数据驱动的TableView", targetVC: DataDriveTableViewViewController()),
                          ItemModel.init(title: "导航栏渐变的TableView", targetVC: GradientNaviViewController()),
                          ItemModel.init(title: "含timer的cell", targetVC: CQTimerCellController()),
                          ItemModel.init(title: "PNChart与tableView的联动", targetVC: CQChartController(title: nil, url: "https://www.jianshu.com/p/759ea22a2a0f")),
                          ItemModel.init(title: "泛型tableView", targetVC: GenericsTableDemoViewController()),
                          ItemModel.init(title: "终极tableView", targetVC: UltimateTableViewController())]
        
    }
    
}
