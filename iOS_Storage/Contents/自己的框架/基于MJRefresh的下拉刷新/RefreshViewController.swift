//
//  RefreshViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/20.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import MJRefresh

class RefreshViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.mj_header = DSRefreshHeader.init(refreshingBlock: {
            print("刷新")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                tableView.mj_header?.endRefreshing()
            }
        })
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
        
    }
    
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = "鲁班7号"
        return cell!
    }

}
