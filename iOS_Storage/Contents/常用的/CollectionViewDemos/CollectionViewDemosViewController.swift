//
//  CollectionViewDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CollectionViewDemosViewController: JumpListViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "标准CollectionView OC版", targetVC: CQStandardOCCollectionViewViewController()),
                          ItemModel.init(title: "标准CollectionView Swift版", targetVC: StandardSwiftCollectionViewViewController()),
                          ItemModel.init(title: "常用CollectionViewLayout", targetVC: CollectionViewLayoutDemoViewController()),
                          ItemModel.init(title: "自定义UICollectionViewLayout", targetVC: CustomLayoutViewController())]
        
    }
    
    
}
