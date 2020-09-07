//
//  DemoTableViewController.swift
//  rebate
//
//  Created by 刘磊 on 2020/8/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import UIKit

class DemoTableViewController<Cell: UITableViewCell & ModelBindedView, Header: UITableViewHeaderFooterView & ModelBindedView, Footer: UITableViewHeaderFooterView & ModelBindedView>: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArray: [TestSectionModel<Header.ViewModel, Footer.ViewModel, Cell.ViewModel>] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].cellModels?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = String(describing: Cell.self)
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? Cell {
            if let model = dataArray[indexPath.section].cellModels?[indexPath.row] {
                cell.bindModel(model)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerReuseID = String(describing: Header.self)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseID) as? Header
        if let model = dataArray[section].headerModel {
            header?.bindModel(model)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerReuseID = String(describing: Footer.self)
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerReuseID) as? Footer
        if let model = dataArray[section].footerModel {
            footer?.bindModel(model)
        }
        return footer
    }
}
