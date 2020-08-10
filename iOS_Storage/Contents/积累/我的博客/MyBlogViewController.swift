//
//  MyBlogViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import HandyJSON
import Alamofire
import MJRefresh

class MyBlogViewController: CQBaseViewController {
    
    private var page = 1
    
    private var dataArray: [BlogEntity?] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 100
        table.register(.init(nibName: BlogCell.className, bundle: nil), forCellReuseIdentifier: BlogCell.className)
        table.tableFooterView = UIView()
        table.mj_header = MJRefreshStateHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        table.mj_footer = MJRefreshAutoStateFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMore))
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        refresh()
        
    }
    
}

extension MyBlogViewController {
    
    @objc private func refresh() {
        getBlogList(page: 1)
    }
    
    @objc private func loadMore() {
        page = page + 1
        getBlogList(page: page)
    }
    
    // uid: 4212f351f6b5
    // 文章列表: https://www.jianshu.com/asimov/users/slug/4212f351f6b5/public_notes
    // 文章内容: https://www.jianshu.com/asimov/p/f936bb30f105
    
    func getBlogList(page: Int = 1) {
        
        let url = URL.init(string: "https://www.jianshu.com/asimov/users/slug/4212f351f6b5/public_notes?page=\(page)")!
        AF.request(url, method: .get, parameters: nil).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let data):
                
                if page == 1 {
                    self.dataArray.removeAll()
                }
                
                if let arr = data as? [[String:Any]] {
                    if arr.count == 0 {
                        self.tableView.mj_footer?.endRefreshingWithNoMoreData()
                        return
                    }
                    let array = [BlogEntity].deserialize(from: arr)
                    self.dataArray.append(contentsOf: array ?? [])
                    self.tableView.reloadData()
                }
                
                self.endRefreshing()

            case .failure(let error):

                SVProgressHUD.showInfo(withStatus: error.errorDescription)
                self.endRefreshing()
            }
            
        }
    }
    
    private func endRefreshing() {
        self.tableView.mj_header?.endRefreshing()
        self.tableView.mj_footer?.endRefreshing()
    }
    
}


// MARK: - UITableView DataSource & Delegate

extension MyBlogViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlogCell.className, for: indexPath) as! BlogCell
        cell.model = dataArray[indexPath.row]!.object?.data
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slug = dataArray[indexPath.row]!.object?.data?.slug
        let detailVC = BlogDetailViewController(slug: slug!)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
