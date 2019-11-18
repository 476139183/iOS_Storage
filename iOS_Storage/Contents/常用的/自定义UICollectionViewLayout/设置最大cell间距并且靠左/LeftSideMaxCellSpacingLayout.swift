//
//  LeftSideMaxCellSpacingLayout.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeftSideMaxCellSpacingLayout: UICollectionViewFlowLayout {

    /// 最大cell水平间距
    var maximumInteritemSpacing: CGFloat = 0.0
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        if attributes?.count == 0 {
            return attributes
        }
        
        if attributes?.count == 1 {
            if let currentAttributes = attributes?.first {
                currentAttributes.frame = CGRect(x: self.sectionInset.left, y: currentAttributes.frame.origin.y, width: currentAttributes.frame.size.width, height: currentAttributes.frame.size.height)
            }
            return attributes
        }
        
        
        if let count = attributes?.count {
            for i in 1..<count {
                let currentLayoutAttributes = attributes![i]
                let prevLayoutAttributes = attributes![i-1]
                
                // 如果是组头或组尾
                if prevLayoutAttributes.representedElementKind == UICollectionView.elementKindSectionHeader  || prevLayoutAttributes.representedElementKind == UICollectionView.elementKindSectionFooter {
                    prevLayoutAttributes.frame = CGRect(x: 0, y: prevLayoutAttributes.frame.origin.y, width: prevLayoutAttributes.frame.size.width, height: prevLayoutAttributes.frame.size.height)
                    currentLayoutAttributes.frame = CGRect(x: self.sectionInset.left, y: currentLayoutAttributes.frame.origin.y, width: currentLayoutAttributes.frame.size.width, height: currentLayoutAttributes.frame.size.height)
                } else { // 如果是cell
                    // 如果是第一个cell
                    if prevLayoutAttributes.indexPath.row == 0 {
                        prevLayoutAttributes.frame = CGRect(x: self.sectionInset.left, y: self.sectionInset.top, width: prevLayoutAttributes.frame.size.width, height: prevLayoutAttributes.frame.size.height)
                    }
                    
                    // 不在同一行
                    if currentLayoutAttributes.frame.origin.y != prevLayoutAttributes.frame.origin.y {
                        currentLayoutAttributes.frame = CGRect(x: self.sectionInset.left, y: currentLayoutAttributes.frame.origin.y, width: currentLayoutAttributes.frame.size.width, height: currentLayoutAttributes.frame.size.height)
                    } else { // 在同一行
                        let prevOriginMaxX = prevLayoutAttributes.frame.maxX
                        if currentLayoutAttributes.frame.origin.x - prevOriginMaxX > maximumInteritemSpacing {
                            var frame = currentLayoutAttributes.frame
                            if prevLayoutAttributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                                frame.origin.x = self.sectionInset.left
                            } else {
                                frame.origin.x = prevOriginMaxX + maximumInteritemSpacing
                            }
                            
                            currentLayoutAttributes.frame = frame
                        } else if currentLayoutAttributes.frame.origin.x - prevOriginMaxX < self.minimumInteritemSpacing {
                            var frame = currentLayoutAttributes.frame
                            frame.origin.x = prevOriginMaxX + maximumInteritemSpacing
                            currentLayoutAttributes.frame = frame
                        }
                    }
                    
                }
                
            }
        }
        
        return attributes
        
    }
    
}
