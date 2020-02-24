//
//  CollectionViewVerticalFlowLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

/// 常规竖向布局
class CollectionViewVerticalFlowLayout: UICollectionViewFlowLayout {
    
    init(cellSpacing: CGFloat, itemSize: CGSize, inset: UIEdgeInsets) {
        super.init()
        
        self.scrollDirection = .vertical
        self.minimumInteritemSpacing = cellSpacing
        self.itemSize = itemSize
        self.sectionInset = inset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
