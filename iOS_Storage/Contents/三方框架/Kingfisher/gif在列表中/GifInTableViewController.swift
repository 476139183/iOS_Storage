//
//  GifInTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GifInTableViewController: CQBaseViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(.init(nibName: "LocalGifCell", bundle: nil), forCellReuseIdentifier: LocalGifCell.className())
        tableView.register(.init(nibName: "WebGifCell", bundle: nil), forCellReuseIdentifier: WebGifCell.className())
        tableView.register(.init(nibName: "KingfisherAnimatedCell", bundle: nil), forCellReuseIdentifier: KingfisherAnimatedCell.className())
        tableView.rowHeight = 90
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row%3 {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: LocalGifCell.className(), for: indexPath)
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: WebGifCell.className(), for: indexPath)
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: KingfisherAnimatedCell.className(), for: indexPath)
        default:
            return tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className(), for: indexPath)
        }
    }

}
