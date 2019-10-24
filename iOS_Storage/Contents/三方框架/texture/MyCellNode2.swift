//
//  MyCellNode2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode2: ASCellNode {
    lazy var postLocationNode: ASTextNode = {
        return ASTextNode()
    }()
    
    lazy var userNameNode: ASTextNode = {
        return ASTextNode()
    }()
    
    lazy var postTimeNode: ASTextNode = {
        return ASTextNode()
    }()
    
    override init() {
        super.init()
        
        self.postLocationNode.attributedText = NSAttributedString(string: "san fran ca")
        self.userNameNode.attributedText = NSAttributedString(string: "hannahmbanana")
        self.postTimeNode.attributedText = NSAttributedString(string: "30m")
        addSubnode(postLocationNode)
        addSubnode(userNameNode)
        addSubnode(postTimeNode)
        postTimeNode.backgroundColor = .brown
        userNameNode.backgroundColor = .cyan
        postLocationNode.backgroundColor = .green
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        // 声明一个垂直排列的盒子
        let nameLocationStack = ASStackLayoutSpec.vertical()
        // 定义了项目的缩小比例，默认为 1，即如果空间不足，该项目将缩小
        // 如所有元素都为 1，空间不足时，所有元素等比例缩放
        // 如其中一个是 0，则此元素不缩放，其他元素均分剩余空间
        nameLocationStack.style.flexShrink = 1
        // 定义元素的放大比例，默认为 0，即如果存在剩余空间，也不放大
        // 如所有元素都为 1，均分剩余空间
        // 如其中一个为 2，那么这个元素占据的空间是其他元素的一倍
        nameLocationStack.style.flexGrow = 1
        
        nameLocationStack.children = [userNameNode, postLocationNode]
        
        let headerStackSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 40, justifyContent: .start, alignItems: .center, children: [nameLocationStack, postTimeNode])
        
        // 插入布局规则
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), child: headerStackSpec)
    }
}
