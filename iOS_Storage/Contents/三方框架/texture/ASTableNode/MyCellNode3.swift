//
//  MyCellNode3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode3: ASCellNode {
    let photoNode = ASImageNode()
    let titleNode = ASTextNode()
    
    
    override func didLoad() {
        super.didLoad()
        
        addSubnode(photoNode)
        addSubnode(titleNode)
        
        photoNode.image = UIImage(named: "qbl")
        titleNode.attributedText = NSAttributedString.attributedString(string: "title", fontSize: 30, color: .white)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let photoDimension: CGFloat = constrainedSize.max.width / 4.0
        photoNode.style.preferredSize = CGSize(width: photoDimension, height: photoDimension)
        // CGFloat.infinity 设定 titleNode 上边距无限大
        let insets = UIEdgeInsets(top: CGFloat.infinity, left: 12, bottom: 12, right: 12)
        let textInsetSpec = ASInsetLayoutSpec(insets: insets, child: titleNode)
        return ASOverlayLayoutSpec(child: photoNode, overlay: textInsetSpec)
    }
}
