//
//  StaticTableNaviPerfectController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/26.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableNaviPerfectController: UITableViewController {
    
    private lazy var naviView: CQBaseNaviBar = {
        let navi = CQBaseNaviBar()
        navi.backgroundColor = .blue
        navi.titleLabel.text = "自定义导航栏"
        return navi
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        self.tableView.contentInset = .init(top: naviHeight, left: 0, bottom: 0, right: 0)
        
        view.addSubview(naviView)
        naviView.frame = .init(x: 0, y: -naviHeight, width: screenWidth, height: naviHeight)
        
        // view 就是 tableView
        print(view)
        print(tableView)

    }
    
    // 方案一：在 scrollViewDidScroll 调整导航栏的 frame
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        naviView.frame = .init(x: 0, y: scrollView.contentOffset.y, width: screenWidth, height: naviHeight)
//    }
    
    // 方案二：在 viewDidLayoutSubviews 里调整导航栏的 frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        naviView.frame = .init(x: 0, y: tableView.contentOffset.y, width: screenWidth, height: naviHeight)
    }
    
}
