//
//  LeftSideLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeftSideLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        if attributes?.count == 1 {
            
            if let currentAttribute = attributes?.first {
                currentAttribute.frame = CGRect(x: self.sectionInset.left, y: currentAttribute.frame.origin.y, width: currentAttribute.frame.size.width, height: currentAttribute.frame.size.height)
            }
            
        }
        
        
        return attributes
        
    }
    
}
