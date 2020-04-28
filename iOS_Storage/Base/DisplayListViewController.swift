//
//  DisplayListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/28.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

/// 纯展示的简单列表
class DisplayListViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// 直接给它赋值即可
    var textArray: [String] = [] {
        didSet {
            tableView.reloadData()
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - UITableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = textArray[indexPath.row]
        return cell!
    }

}
