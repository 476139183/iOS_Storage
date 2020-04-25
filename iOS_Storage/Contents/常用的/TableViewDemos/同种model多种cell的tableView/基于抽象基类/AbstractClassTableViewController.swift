//
//  AbstractClassTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class AbstractClassTableViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        return cell!
    }
    
}
