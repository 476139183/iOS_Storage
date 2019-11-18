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
        
        
        if let attributes = attributes, attributes.count > 1 {
            
            for i in 1..<attributes.count {
                
                let currentLayoutAttributes = attributes[i]
                let previousLayoutAttributes = attributes[i-1]
                
                if i == 1 {
                    previousLayoutAttributes.frame = CGRect(x: self.sectionInset.left, y: previousLayoutAttributes.frame.origin.y, width: previousLayoutAttributes.frame.size.width, height: previousLayoutAttributes.frame.size.height)
                }
                
                // 如果是另起一行
                if currentLayoutAttributes.frame.origin.y != previousLayoutAttributes.frame.origin.y {
                    
                    currentLayoutAttributes.frame = CGRect(x: self.sectionInset.left, y: currentLayoutAttributes.frame.origin.y, width: currentLayoutAttributes.frame.size.width, height: currentLayoutAttributes.frame.size.height)
                    
                }
                
            }
            
        }
        
        return attributes
        
    }
    
}
