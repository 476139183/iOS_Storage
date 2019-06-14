//
//  MultiThreadController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MultiThreadController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {

    let dataArray = ["pthread", "NSThread", "NSOperation", "GCD", "请求多个接口", "锁"]
    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    

    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc:CQBaseViewController
        switch indexPath.row {
        case 0:
            vc = CQPthreadController.init()
        case 1:
            vc = CQThreadViewController.init()
        case 2:
            vc = CQOperationController.init()
        case 3:
            vc = CQGCDController.init()
        case 4:
            vc = CQMultiInterfaceViewController.init()
        case 5:
            vc = CQLockViewController.init()
        default:
            vc = CQBaseViewController.init()
        }
        
        vc.title = self.dataArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
