//
//  MyCellNode5.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode5: ASCellNode {
    let myImageNode = ASImageNode()
    let titleNode = ASTextNode()
    
    override init() {
        super.init()
        
        addSubnode(myImageNode)
        addSubnode(titleNode)
        
        myImageNode.cornerRadius = 10
        
        myImageNode.image = UIImage.init(named: "qbl")
        titleNode.attributedText = NSAttributedString.attributedString(string: "title", fontSize: 20, color: .red)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let photoDimension: CGFloat = constrainedSize.max.width / 4
        myImageNode.style.preferredSize = CGSize.init(width: photoDimension, height: photoDimension)
        // CGFloat.infinity 设定 titleNode 上边距无限大
        let insets = UIEdgeInsets.init(top: CGFloat.infinity, left: 12, bottom: 12, right: 12)
        // title的布局
        let textInsetSpec = ASInsetLayoutSpec.init(insets: insets, child: titleNode)
        return ASOverlayLayoutSpec.init(child: myImageNode, overlay: textInsetSpec)
    }
}
