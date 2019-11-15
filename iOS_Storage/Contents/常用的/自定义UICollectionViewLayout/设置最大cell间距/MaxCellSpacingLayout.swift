//
//  MaxCellSpacingLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MaxCellSpacingLayout: UICollectionViewFlowLayout {
    
    /// 最大cell水平间距
    var maximumInteritemSpacing: CGFloat = 0.0
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        if attributes?.count == 0 {
            return attributes
        }
        
        let firstCellOriginX = attributes?.first?.frame.origin.x
        
        if let count = attributes?.count {
            
            for i in 1..<count {
                let currentLayoutAttributes = attributes![i]
                let prevLayoutAttributes = attributes![i-1]
                
                if currentLayoutAttributes.frame.origin.x == firstCellOriginX {
                    continue
                }
                
                let prevOriginMaxX = prevLayoutAttributes.frame.maxX
                if currentLayoutAttributes.frame.origin.x - prevOriginMaxX > maximumInteritemSpacing {
                    var frame = currentLayoutAttributes.frame
                    frame.origin.x = prevOriginMaxX + maximumInteritemSpacing
                    currentLayoutAttributes.frame = frame
                }
            }
            
        }
        
        return attributes
        
    }
    
}
