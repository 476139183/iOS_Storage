//
//  PlaceholderViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/31.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PlaceholderViewController: CQBaseViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let addItem = UIBarButtonItem.init(title: "add", style: .plain, target: self, action: #selector(addButtonClicked))
        let removeItem = UIBarButtonItem.init(title: "remove", style: .plain, target: self, action: #selector(removeButtonClicked))
        
        navigationItem.rightBarButtonItems = [removeItem, addItem]
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
            make.bottom.equalToSuperview().offset(-kTabBarHeight)
        }
        
    }
    
    
    @objc func addButtonClicked() {
        PlaceholderView.show(on: tableView, type: .noData, title: "无数据") {
            print("点击占位图")
        }
    }
    
    @objc func removeButtonClicked() {
        PlaceholderView.remove(from: self.tableView)
    }
    
}
