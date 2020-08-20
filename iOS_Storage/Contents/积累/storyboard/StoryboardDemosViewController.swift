//
//  StoryboardDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StoryboardDemosViewController: SelectorListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [SelectorModel(title: "静态tableView", selector: #selector(gotoStaticTableView)),
                          SelectorModel(title: "添加表头表尾", selector: #selector(staticTableWithHeaderFooter)),
                          SelectorModel(title: "添加自定义导航栏", selector: #selector(staticTableWithNavi))]
        
    }
    
    @objc private func gotoStaticTableView() {
        let vc = StaticTableController1()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func staticTableWithNavi() {
        let vc = UIStoryboard(name: "StaticTableStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaticTableNaviViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func staticTableWithHeaderFooter() {
        let vc = UIStoryboard(name: "StaticTableStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaticTableHeaderFooterController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
