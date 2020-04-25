//
//  WaterfallLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class WaterfallLayout: UICollectionViewLayout {
    
    var sectionInset: UIEdgeInsets = .zero
    /// cell间距
    var cellSpacing: CGFloat = 0
    /// cell行距
    var lineSpacing: CGFloat = 0
    
    
    //CollectionView会在初次布局时首先调用该方法
    //CollectionView会在布局失效后、重新查询布局之前调用此方法
    //子类中必须重写该方法并调用超类的方法
    override func prepare() {
        super.prepare()
        
    }
    
    //子类必须重写此方法。
    //并使用它来返回CollectionView视图内容的宽高，
    //这个值代表的是所有的内容的宽高，并不是当前可见的部分。
    //CollectionView将会使用该值配置内容的大小来促进滚动。
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 1000, height: 1000)
    }
    
    
    //当Bounds改变时，返回YES使CollectionView重新查询几何信息的布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        if let count = attributes?.count {
            for index in 0..<count {
                let att = attributes![index]
                att.frame = CGRect(x: 90, y: 90, width: 200, height: 200)
            }
        }
        
        return attributes
        
    }
    
}
