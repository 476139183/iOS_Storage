//
//  NestedItemTableView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import MJRefresh

class NestedItemTableView: UIView, UITableViewDataSource, UITableViewDelegate, JXPagingViewListViewDelegate {
    
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    
    // MARK: - Lazy
    
    private lazy var dataArray: Array = {
        return ["1", "2", "3", "4", "5"]
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.mj_header = MJRefreshHeader(refreshingBlock: {
            print("下拉刷新")
        })
        tableView.mj_footer = MJRefreshAutoFooter(refreshingBlock: { [weak self] in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                strongSelf.dataArray.append(contentsOf: ["1", "2", "3", "4", "5"])
                print("加载更多完成")
                strongSelf.tableView.mj_footer?.endRefreshing()
                strongSelf.tableView.reloadData()
            }
        })
        return tableView
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel!.text = dataArray[indexPath.row]
        return cell!
    }
    
    
    // MARK: - UIScrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
    
    
    // MARK: - JXPagingViewListViewDelegate
    
    func listView() -> UIView {
        return self
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }
    
    func listScrollView() -> UIScrollView {
        return self.tableView
    }

}
