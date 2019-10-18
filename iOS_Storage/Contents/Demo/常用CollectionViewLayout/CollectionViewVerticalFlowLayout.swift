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
    
//    open var minimumLineSpacing: CGFloat
//
//    open var minimumInteritemSpacing: CGFloat
//
//    open var itemSize: CGSize
//
//    @available(iOS 8.0, *)
//    open var estimatedItemSize: CGSize // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
//
//    open var scrollDirection: UICollectionView.ScrollDirection // default is UICollectionViewScrollDirectionVertical
//
//    open var headerReferenceSize: CGSize
//
//    open var footerReferenceSize: CGSize
//
//    open var sectionInset: UIEdgeInsets
    
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
