//
//  TalkCellNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/26.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TalkCellNode: ASCellNode {
    
    private lazy var talkNode: TalkNode = {
        let node = TalkNode()
        return node
    }()
    
    override func didLoad() {
        backgroundColor = .white
        addSubnode(talkNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASInsetLayoutSpec.init(insets: .init(top: 20, left: 16, bottom: 20, right: 16), child: talkNode)
        return layout
    }
    
}

fileprivate class TalkNode: ASDisplayNode {
    
    private lazy var imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage.init(named: "iu")
        return node
    }()
    
    private lazy var titleNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString.attributedString(string: "#最近值得买的球鞋", font: .systemFont(ofSize: 15, weight: .semibold), color: .black)
        return node
    }()
    
    private lazy var descNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString.attributedString(string: "今天SNKRS突袭，你抢到了几双", font: .systemFont(ofSize: 12), color: .gray)
        return node
    }()
    
    override func didLoad() {
        backgroundColor = UIColor.colorWithHexString("#F7F7F9")
        addSubnode(imageNode)
        addSubnode(titleNode)
        addSubnode(descNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.preferredSize = .init(width: 42, height: 42)
        imageNode.style.layoutPosition = .init(x: 12, y: 12)
        
        titleNode.style.preferredSize = .init(width: screenWidth-78-50, height: 15)
        titleNode.style.layoutPosition = .init(x: 62, y: 16)
        
        descNode.style.preferredSize = .init(width: screenWidth - 78 - 50, height: 13)
        descNode.style.layoutPosition = .init(x: 62, y: 39)
        
        let layout = ASAbsoluteLayoutSpec.init(children: [imageNode, titleNode, descNode])
        
        let insetLayout = ASInsetLayoutSpec.init(insets: .init(top: 0, left: 0, bottom: 12, right: 0), child: layout)
        
        return insetLayout
    }
    
}
