//
//  StandardSwiftCollectionViewViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftCollectionViewViewController: CQBaseViewController {
    
    let collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout.init()
        // 设置横向滚动or竖向滚动
        layout.scrollDirection = .vertical
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
    }

}
