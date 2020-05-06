//
//  HorizonCollectionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class HorizonCollectionViewController: CQBaseViewController {
    
    /// 横向collectionView
    private lazy var horizontalFlowLayoutCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHorizontalFlowLayout(cellSpacing: 40, itemSize: CGSize(width: 100, height: 100), inset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)))
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className())
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(horizontalFlowLayoutCollection)
        
        horizontalFlowLayoutCollection.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.left.right.equalToSuperview()
            make.height.equalTo(159)
        }
        
    }
    
}

extension HorizonCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className(), for: indexPath)
        cell.contentView.backgroundColor = .orange
        return cell
    }
    
}
