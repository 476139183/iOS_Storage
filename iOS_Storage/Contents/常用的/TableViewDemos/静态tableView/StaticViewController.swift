//
//  StaticViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StaticViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var dataArray: [Model] = [Model(title: "静态tableView", sel: #selector(gotoMyTableVC))]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = .init(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: screenHeight-kNavigationBarHeight)
        
    }
    
    
    // MARK: - action
    
    @objc func gotoMyTableVC() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = dataArray[indexPath.row].title
        return cell!
    }
    
}


fileprivate struct Model {
    var title: String
    var sel: Selector
}
