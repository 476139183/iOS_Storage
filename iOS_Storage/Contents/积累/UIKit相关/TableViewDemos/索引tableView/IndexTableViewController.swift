//
//  IndexTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class IndexTableViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [IndexSectionModel] = {
        var array: [IndexSectionModel] = []
        for i in 0..<10 {
            let sectionModel = IndexSectionModel()
            sectionModel.title = "\(i)"
            for i in 10..<15 {
                let itemModel = IndexItemModel()
                itemModel.title = "\(i)"
                sectionModel.items.append(itemModel)
            }
            array.append(sectionModel)
        }
        return array
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 30
        tableView.sectionHeaderHeight = 60
        tableView.sectionFooterHeight = 0
        tableView.sectionIndexColor = UIColor.red
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    // MARK: - UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        let itemModel = dataArray[indexPath.section].items[indexPath.row]
        cell?.textLabel!.text = itemModel.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = dataArray[section]
        return model.title
    }
    
    // 这两个代理方法用于展示Index
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataArray.map { (model) -> String in
            return model.title
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
}


// MARK: - Model

class IndexSectionModel {
    
    var title = ""
    var items: [IndexItemModel] = []
    
}

class IndexItemModel {
    
    var title = ""
    
}
