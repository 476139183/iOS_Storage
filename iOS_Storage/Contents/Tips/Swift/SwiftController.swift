//
//  SwiftController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/5/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class SwiftController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView.init()
    let dataArray:Array = ["基本类型", "流程语句", "函数"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - UITableView DataSource && Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = "cellReuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellReuseID)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
