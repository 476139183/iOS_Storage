//
//  BubbleLoadingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BubbleLoadingViewController: CQBaseViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .orange
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviHeight)
        }
        
        BubbleLoading.show(on: tableView, loadingY: 100)
        BubbleLoading.show(on: tableView, edge: .init(top: 20, left: 20, bottom: 100, right: 20), loadingY: 40)
        
    }

}
