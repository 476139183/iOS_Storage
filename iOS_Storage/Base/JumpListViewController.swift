//
//  JumpListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/28.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

/// 简单的跳转列表（点击cell，跳转到指定页面）
class JumpListViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// 给它赋值即可
    var dataArray: [ItemModel] = [] {
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
        
        self.naviBar.detailButton.isHidden = true
        
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
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[indexPath.row]
        guard let targetVC = model.targetVC else {
            return
        }
        targetVC.title = model.title
        navigationController?.pushViewController(targetVC, animated: true)
    }

}


// MARK: - Model

struct ItemModel {
    /// 标题
    var title: String
    /// 要跳转到的页面
    var targetVC: UIViewController? = nil
}
