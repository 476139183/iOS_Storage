//
//  GenericsTableViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit


/// D 表示 dataArray；C 表示 cell；
class GenericsTableViewController2: BaseGenericsTableViewController<FlowerModel, FlowerCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m1 = FlowerModel.init(name: "栀子花", image: "iu")
        let m2 = FlowerModel.init(name: "喇叭花", image: "iu")
        let m3 = FlowerModel.init(name: "紫藤花", image: "iu")
        
        dataArray = [m1, m2, m3]
        
        tableView.rowHeight = 80
        
    }
    
}
