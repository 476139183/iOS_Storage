//
//  ChangeSectionHeaderPositionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ChangeSectionHeaderPositionViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let kTableHeaderHeight: CGFloat = 100
    private let kSegmentViewHeight: CGFloat = 50
    
    /// 表头
    private lazy var tableHeaderView: TableHeader = {
        let header = TableHeader()
        header.frame = .init(x: 0, y: -kTableHeaderHeight, width: kScreenWidth, height: kTableHeaderHeight)
        return header
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.tableHeaderView = tableHeaderView
        tableView.rowHeight = 40
        tableView.sectionHeaderHeight = 60
        tableView.contentInset = .init(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        //tableView.contentOffset = .init(x: 0, y: -kTableHeaderHeight)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
            make.bottom.equalToSuperview().offset(-kTabBarHeight)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        print(scrollView.contentOffset.y)
        
        if contentOffsetY > -50 {
            tableView.contentInset = .init(top: kSegmentViewHeight, left: 0, bottom: 0, right: 0)
        } else {
            tableView.contentInset = .init(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseID = "reuseID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID)
        if header == nil {
            header = SectionHeader(reuseIdentifier: reuseID)
        }
        return header
    }
    
}


// MARK: - 表头

fileprivate class TableHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let label1 = UILabel()
        addSubview(label1)
        label1.backgroundColor = .green
        label1.text = "这是不展示的"
        label1.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY)
        }
        
        let label2 = UILabel()
        addSubview(label2)
        label2.backgroundColor = .orange
        label2.text = "这是要展示的"
        label2.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.snp.centerY)
        }
        
    }
    
}


// MARK: - 组头

fileprivate class SectionHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let label = UILabel()
        addSubview(label)
        label.backgroundColor = .red
        label.text = "组头"
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
