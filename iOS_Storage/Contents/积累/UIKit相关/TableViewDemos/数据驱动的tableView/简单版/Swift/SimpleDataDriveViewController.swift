//
//  SimpleDataDriveViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import MJRefresh

class SimpleDataDriveViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var dataArray: [Int] = [1, 2, 3] {
        didSet {
            // didSet 属性观察器，数据驱动的关键
            tableView.reloadData()
            tableView.mj_footer?.endRefreshing()
            print("调用了 dataArray 的 didSet")
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.mj_footer = MJRefreshBackStateFooter(refreshingTarget: self, refreshingAction: #selector(loadData))
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        naviBar.titleLabel.text = "数据驱动简单版"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
        
    }
    
    @objc private func loadData() {
        // 下面都会触发dataArray的didSet
        dataArray += [4, 5, 6, 7, 8]
        //dataArray.append(666)
        //dataArray[0] = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = "\(dataArray[indexPath.row])  上拉加载更多"
        return cell!
    }

}
