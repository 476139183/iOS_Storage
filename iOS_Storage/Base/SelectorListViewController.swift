//
//  SelectorListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/28.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SelectorListViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [SelectorModel] = [] {
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
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sel = dataArray[indexPath.row].selector else {
            return
        }
        perform(sel)
    }

}


// MARK: - Model

struct SelectorModel {
    /// 标题
    var title: String
    /// 要执行的方法
    var selector: Selector? = nil
}
