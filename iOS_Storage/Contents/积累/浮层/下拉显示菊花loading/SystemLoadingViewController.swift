//
//  SystemLoadingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/11.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SystemLoadingViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView.init(style: .gray)
        view.color = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
        
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(30)
            make.top.equalTo(120)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -30 {
            indicatorView.isHidden = false
            indicatorView.startAnimating()
        } else {
            indicatorView.isHidden = true
            indicatorView.stopAnimating()
        }
    }

}
