//
//  VerticalCollectionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class VerticalCollectionViewController: CQBaseViewController {
    
    /// 竖向collectionView
    private lazy var verticalFlowLayoutCollectionView: UICollectionView = {
        let layout = CollectionViewVerticalFlowLayout.init(cellSpacing: 10, lineSpacing: 5, itemSize: CGSize(width: 100, height: 100), inset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className())
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(verticalFlowLayoutCollectionView)
        
        verticalFlowLayoutCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(naviHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }

}


extension VerticalCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className(), for: indexPath)
        cell.contentView.backgroundColor = .orange
        return cell
    }
    
}
