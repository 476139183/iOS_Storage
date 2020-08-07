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
        
        self.dataArray = [SelectorModel(title: "静态tableView", selector: #selector(gotoStaticTableView))]
        
    }
    
    @objc private func gotoStaticTableView() {
        let vc = UIStoryboard(name: "StaticTableStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "StaticTableController")
        navigationController?.pushViewController(vc, animated: true)
    }

}
