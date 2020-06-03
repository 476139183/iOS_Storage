//
//  JXSegmentedChildController3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class JXSegmentedChildController3: JXSegmentedDemoBaseController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 100
        tableView.rowHeight = 30
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("vc3 load")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
            cell?.contentView.backgroundColor = .blue
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseID = "headerID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID)
        if header == nil {
            header = UITableViewHeaderFooterView.init(reuseIdentifier: reuseID)
            header?.contentView.backgroundColor = .red
            
            let line = UIView()
            line.backgroundColor = .black
            header?.contentView.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
        }
        return header
    }

}
