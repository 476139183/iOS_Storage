//
//  FlatTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

enum ViewStatus {
    case normal
    case loading
    case empty(title: String?)
    case error(title: String?)
}

class FlatTableViewController<T>: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [T] = [] {
        didSet {
            handleDataArrayChanged()
        }
    }
    
    var viewStatus: ViewStatus = .normal {
        didSet {
            handleViewStatus()
        }
    }
    
    /// 是否支持下拉刷新
    var enableRefresh = true {
        didSet {
            if enableRefresh {
                self.tableView.mj_header = refreshHeader
            } else {
                self.tableView.mj_header = nil
            }
        }
    }
    
    /// 是否支持上拉加载更多
    var enableLoadMore = true {
        didSet {
            if enableLoadMore {
                self.tableView.mj_footer = loadMoreFooter
            } else {
                self.tableView.mj_footer = nil
            }
        }
    }
    
    /// 刷新 header
    private lazy var refreshHeader: DSRefreshHeader = {
        let header = DSRefreshHeader.init(refreshingTarget: self, refreshingAction: #selector(pullDownRefresh))
        return header
    }()
    
    /// 加载更多 fotter
    private lazy var loadMoreFooter: MJRefreshAutoFooter = {
        let footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(pullUpLoadMore))
        return footer
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
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
        
        // 默认支持下拉刷新和上拉加载更多
        self.enableRefresh = true
        self.enableLoadMore = true
        
        //
        
    }
    
    /// 处理数据源变化
    func handleDataArrayChanged() {
        tableView.reloadData()
        handleNormalViewStatus()
        endRefresh()
    }
    
    
    // MARK: - 处理view状态变化
    
    /// 处理view状态变化
    func handleViewStatus() {
        switch viewStatus {
        case .normal:
            handleNormalViewStatus()
        case .loading:
            handleLoadingViewStatus()
        case .empty(let title):
            handleEmptyViewStatus(title: title)
        case .error(let title):
            handleErrorViewStatus(title: title)
        }
    }
    
    func handleNormalViewStatus() {
        PlaceholderView.remove(from: tableView)
        Loading.remove(from: tableView)
        endRefresh()
    }
    
    func handleLoadingViewStatus() {
        PlaceholderView.remove(from: tableView)
        Loading.show(on: tableView)
    }
    
    func handleEmptyViewStatus(title: String?) {
        PlaceholderView.show(on: tableView, type: .noData, title: title ?? "这里空空的", tapedColsure: {
            self.handlePlaceholderViewTaped()
        })
        endRefresh()
    }
    
    func handleErrorViewStatus(title: String?) {
        PlaceholderView.show(on: tableView, type: .networkError, title: title ?? "网络不给力", tapedColsure: {
            self.handlePlaceholderViewTaped()
        })
        endRefresh()
    }
    
    
    // MARK: - 处理占位图点击
    
    /// 处理占位图点击
    func handlePlaceholderViewTaped() {
        // 默认等同于下拉刷新
        pullDownRefresh()
    }
    
    
    // MARK: - 下拉刷新与加载更多
    
    /// 下拉刷新
    @objc func pullDownRefresh() {
        
        if dataArray.count == 0 {
            viewStatus = .loading
        } else {
            switch viewStatus {
            case .empty(_), .error(_):
                viewStatus = .loading
            default:
                break
            }
        }
        
    }
    
    /// 上拉加载更多
    @objc func pullUpLoadMore() {
        
    }
    
    /// 结束刷新
    func endRefresh() {
        self.tableView.mj_header?.endRefreshing()
        self.tableView.mj_footer?.endRefreshing()
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
        return cell!
    }
    
    
}
