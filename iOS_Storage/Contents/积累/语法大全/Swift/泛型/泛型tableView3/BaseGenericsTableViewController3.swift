//
//  BaseGenericsTableViewController3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseGenericsTableViewController3<CM: BaseModel3, C: BaseCell3<CM>, HM: BaseModel3, H: BaseHeader3<HM>, S: SectionModel<HM, CM>>: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [S] = [] {
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
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID) as? C
        if cell == nil {
            cell = C.init(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.model = dataArray[indexPath.section].cellModels?[indexPath.row]
        return cell ?? UITableViewCell()
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
