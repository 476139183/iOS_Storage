//
//  PreloadTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

// 细节
// 如果上拉加载更多，判断加载完成时的page跟开始刷新时的page是否一致，如果不一致，不做任何操作
// 下拉刷新，立即将page重置为0，关闭加载更多状态。

import UIKit
import MJRefresh

class PreloadTableViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// 是否正在加载更多
    var isLoadingMore = false
    
    var page: Int = 0
    
    private lazy var dataArray: [String] = {
        return ["0", "0", "0", "0", "0"]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 200
        tableView.mj_header = DSRefreshHeader(refreshingTarget: self, refreshingAction: #selector(pullDownRefresh))
        tableView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: #selector(pullUpLoadMore))
        return tableView
    }()
    
    /// 预加载label
    private lazy var preloadingLabel: UILabel = {
        let label = UILabel()
        label.text = "正在预加载。。。"
        label.backgroundColor = .yellow
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
            make.bottom.equalToSuperview().offset(-tabbarHeight)
        }
        
        view.addSubview(preloadingLabel)
        preloadingLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    
    // MARK: - Action
    
    private func loadDataWith(requiredPage: Int, success: (([String]) -> ())?) {
        // 延迟2秒，模拟网络请求
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            success?(Array.init(repeating: "\(requiredPage)", count: 5))
        }
    }
    
    /// 下拉刷新
    @objc private func pullDownRefresh() {
        print("下拉刷新")
        
        self.tableView.mj_footer?.endRefreshing()
        self.tableView.mj_footer?.resetNoMoreData()
        
        loadDataWith(requiredPage: 0) { (datas) in
            self.dataArray.removeAll()
            self.tableView.mj_header?.endRefreshing()
            self.page = 0
            self.dataArray.append(contentsOf: datas)
            self.tableView.reloadData()
        }
        
    }
    
    /// 上拉加载更多
    @objc private func pullUpLoadMore() {
        print("加载更多")
        if isLoadingMore {
            return
        }
        
        isLoadingMore = true
        // 请求后一页的数据
        let requiredPage = page + 1
        loadDataWith(requiredPage: requiredPage) { [weak self] (datas) in
            
            guard let self = self else {
                return
            }
            
            // 请求的page跟当前的page不一致了，比如说请求数据过程中执行了下拉刷新
            if requiredPage != self.page + 1 {
                return
            }
            
            self.dataArray.append(contentsOf: datas)
            self.tableView.reloadData()
            self.tableView.mj_footer?.endRefreshing()
            self.isLoadingMore = false
            
            if self.page == 10 {
                self.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }
            self.page = self.page + 1
            
            self.preloadingLabel.isHidden = true
        }
    }
    
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataArray.count - 3 {
            print("执行预加载")
            preloadingLabel.isHidden = false
            // 预加载，就相当于执行了一次上拉加载更多
            pullUpLoadMore()
        }
    }
    
}
