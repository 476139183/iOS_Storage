//
//  BaseGenericsTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

/// M 表示 model，C 表示 cell
class BaseGenericsTableViewController<M, C: BaseGenericsCell<M>>: CQBaseViewController, UITableViewDataSource, UITableViewDelegate where M: BaseModel{
    
    var dataArray: [M] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? C
        if cell == nil {
            cell = C.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.model = dataArray.item(indexPath: indexPath)
        return cell ?? UITableViewCell()
    }

}
