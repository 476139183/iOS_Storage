//
//  BaseStaticTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseStaticTableViewController: UITableViewController {
    
    lazy var naviBar: CQBaseNaviBar = {
        let navi = CQBaseNaviBar()
        navi.titleLabel.text = "封装静态tableView"
        navi.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return navi
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.contentInset = .init(top: naviHeight, left: 0, bottom: safeBottomHeight, right: 0)
        
        view.addSubview(naviBar)
        naviBar.frame = .init(x: 0, y: tableView.contentOffset.y, width: screenWidth, height: naviHeight)
        
    }
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        naviBar.frame = .init(x: 0, y: scrollView.contentOffset.y, width: screenWidth, height: naviHeight)
    }

}
