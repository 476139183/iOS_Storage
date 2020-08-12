//
//  SwiftXibTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibTableViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        //table.register(.init(nibName: SwiftXibCell.className, bundle: nil), forCellReuseIdentifier: SwiftXibCell.className)
        table.rowHeight = 50
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: SwiftXibCell.className)
        
        if let _ = Bundle.main.path(forResource: SwiftXibCell.className, ofType: "nib") {
            if cell == nil {
                cell = Bundle.main.loadNibNamed(SwiftXibCell.className, owner: nil, options: nil)?.first as? UITableViewCell
            }
        } else {
            if cell == nil {
                cell = Bundle.main.loadNibNamed(SwiftXibCell.className, owner: nil, options: nil)?.first as? UITableViewCell
            }
        }
        
        return cell!
    }

}


