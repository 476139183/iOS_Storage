//
//  SimpleTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class SimpleTableViewController: CQBaseViewController {
    
    private let delegateHelper = SimpleTableViewHelper()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = delegateHelper
        tableView.delegate = delegateHelper
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        loadData {
            self.tableView.reloadData()
        }
        
    }
    
    private func loadData(completion: @escaping () -> ()) {
        SVProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            SVProgressHUD.dismiss()
            self.delegateHelper.models = [SimpleTableViewModel.init(title: "111"),
                                          SimpleTableViewModel.init(title: "222"),
                                          SimpleTableViewModel.init(title: "333")]
            completion()
        }
    }

}
