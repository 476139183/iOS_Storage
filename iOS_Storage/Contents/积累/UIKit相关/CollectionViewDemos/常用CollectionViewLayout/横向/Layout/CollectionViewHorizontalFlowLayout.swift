//
//  CollectionViewHorizontalFlowLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

/// 常规横向布局
class CollectionViewHorizontalFlowLayout: UICollectionViewFlowLayout {

    /// 构造方法
    /// - Parameters:
    ///   - cellSpacing: cell 间距
    ///   - itemSize: cell 大小
    ///   - inset: 组的 inset
    init(cellSpacing: CGFloat, itemSize: CGSize, inset: UIEdgeInsets) {
        super.init()
        
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = cellSpacing
        self.itemSize = itemSize
        self.sectionInset = inset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
