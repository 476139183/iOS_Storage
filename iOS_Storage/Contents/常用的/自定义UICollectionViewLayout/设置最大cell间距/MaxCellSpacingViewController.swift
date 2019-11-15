//
//  MaxCellSpacingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MaxCellSpacingViewController: CQBaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private lazy var layout: MaxCellSpacingLayout = {
        let layout = MaxCellSpacingLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.maximumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 30, height: 30)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className())
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className(), for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

}
