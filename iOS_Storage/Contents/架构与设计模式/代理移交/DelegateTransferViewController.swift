//
//  DelegateTransferViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class DelegateTransferViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var dataArray: [Model] = {
        let model = Model()
        model.name = "jack"
        return [model]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
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
        
        var model = dataArray[indexPath.row]
        model.name = "Mike"
        
        cell?.textLabel?.text = dataArray[indexPath.row].name
        
        return cell!
    }

}

fileprivate class Model {
    
    var name = ""
    
}
