//
//  StaticTableNaviPerfectController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/26.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableNaviPerfectController2: UITableViewController {
    
    private lazy var naviView: CQBaseNaviBar = {
        let navi = CQBaseNaviBar()
        navi.titleLabel.text = "自定义导航栏"
        navi.backgroundColor = .orange
        return navi
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        self.tableView.backgroundView = UIView.init(frame: UIScreen.main.bounds)

        self.tableView.backgroundView?.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(naviHeight)
        }
        
        
        
        tableView.contentInset = .init(top: naviHeight, left: 0, bottom: 0, right: 0)
        
        tableView.bringSubviewToFront(tableView!.backgroundView!)
        tableView.backgroundView?.bringSubviewToFront(naviView)
        tableView.bringSubviewToFront(naviView)
        //tableView.bringSubviewToFront(tableView?.backgroundView) as! UIView as! UIView
        
    }
    
}
