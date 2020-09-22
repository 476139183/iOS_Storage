//
//  StaticTableXibHeaderFooterController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StaticTableXibHeaderFooterController: BaseStaticTableViewController {
    
    // 表头（外层）
    private lazy var header: UIView = {
        let bgView = UIView.init(frame: .init(x: 0, y: 0, width: screenWidth, height: 0))
        // 把内存view添加到外层view上
        bgView.addSubview(self.headerView)
        // 设置内层view的约束，注意底部约束不设置
        self.headerView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
        // 内层view高度变化，调整外层view的高度
        self.headerView.layoutSubviewsClosure = { [weak self, weak bgView] in
            bgView?.frame = .init(x: 0, y: 0, width: screenWidth, height: self?.headerView.height ?? 0)
            self?.tableView.reloadData()
        }
        return bgView
    }()
    
    // 表头（内层）
    private lazy var headerView: StaticTableXibHeaderView = {
        let view = StaticTableXibHeaderView.loadNib() as! StaticTableXibHeaderView
        return view
    }()
    
    // 表尾（外层）
    private lazy var footer: UIView = {
        let bgView = UIView.init(frame: .init(x: 0, y: 0, width: screenWidth, height: 0))
        // 把内存view添加到外层view上
        bgView.addSubview(self.footerView)
        // 设置内层view的约束，注意底部约束不设置
        self.footerView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
        }
        // 内层view高度变化，调整外层view的高度
        self.footerView.layoutSubviewsClosure = { [weak self, weak bgView] in
            bgView?.frame = .init(x: 0, y: 0, width: screenWidth, height: self?.footerView.height ?? 0)
            self?.tableView.reloadData()
        }
        return bgView
    }()
    
    // 表尾（内层）
    private lazy var footerView: StaticTableXibFooterView = {
        let view = StaticTableXibFooterView.loadNib() as! StaticTableXibFooterView
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        naviBar.titleLabel.text = "xib header footer"
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
    
}
