//
//  StandardSwiftTableViewViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftTableViewViewController: CQBaseViewController {
    
    // style为group，组头不悬停
    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 设置表头
        let tableHeader = StandardSwiftTableHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: 300))
        tableHeader.buttonClickedClosure = {
            print("表头按钮点击")
        }
        self.tableView.tableHeaderView = tableHeader
        
        // 设置表尾
        let tableFooter = StandardSwiftTableFooterView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: 200))
        tableFooter.buttonClickedClosure = { [weak self] in
            print("表尾按钮点击")
            self?.view.backgroundColor = .white
        }
        self.tableView.tableFooterView = tableFooter
    }
    
}

extension StandardSwiftTableViewViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = StandardSwiftTableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel?.text = "第"+String(indexPath.section)+"组,第"+String(indexPath.row)+"行"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseID = "header_reuseID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID) as? StandardSwiftSectionHeaderView
        if header == nil {
            header = StandardSwiftSectionHeaderView.init(reuseIdentifier: reuseID)
        }
        header?.detailButtonClickedClosure = {
            print("组头详情按钮点击")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let reuseID = "footer_reuseID"
        var footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID) as? StandardSwiftSectionFooterView
        if footer == nil {
            footer = StandardSwiftSectionFooterView.init(reuseIdentifier: reuseID)
        }
        footer?.moreButtonClickedClosure = {
            print("组尾button点击")
        }
        return footer
    }
}
