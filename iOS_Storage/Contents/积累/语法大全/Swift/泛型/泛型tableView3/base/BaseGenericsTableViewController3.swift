//
//  BaseGenericsTableViewController3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseGenericsTableViewController3<CM: Any, C: BaseCell3<CM>, HM: Any, H: BaseHeader3<HM>>: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [SectionModel<HM, CM>] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    // MARK: UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].cellModels?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = (dataArray[indexPath.section].cellModels?[indexPath.row])!
        return C.cellWith(model: model, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerReuseID = "headerReuseID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseID) as? H
        if header == nil {
            header = H.init(reuseIdentifier: headerReuseID)
        }
        header?.model = dataArray[section].headerModel
        return header ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

