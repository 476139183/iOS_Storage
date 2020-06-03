//
//  PlaceholderViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/31.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PlaceholderViewController: CQBaseViewController {
    
    private lazy var showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("show", for: .normal)
        button.addTarget(self, action: #selector(showButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("remove", for: .normal)
        button.addTarget(self, action: #selector(removeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(showButton)
        view.addSubview(removeButton)
        view.addSubview(tableView)
        
        showButton.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight+30)
            make.right.equalTo(self.view.snp.centerX).offset(-40)
            make.height.equalTo(30)
        }
        
        removeButton.snp.makeConstraints { (make) in
            make.top.equalTo(showButton)
            make.left.equalTo(self.view.snp.centerX).offset(40)
            make.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(showButton.snp.bottom).offset(30)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    @objc func showButtonClicked() {
        PlaceholderView.show(on: tableView, type: .noData, title: "无数据") {
            print("点击占位图")
        }
    }
    
    @objc func removeButtonClicked() {
        PlaceholderView.remove(from: self.tableView)
    }
    
}
