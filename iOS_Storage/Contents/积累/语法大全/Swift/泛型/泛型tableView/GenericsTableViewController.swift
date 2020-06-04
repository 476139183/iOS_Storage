//
//  GenericsTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsTableViewController<T>: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data: [T] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "泛型 tableView"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "resueID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        return cell!
    }

}
