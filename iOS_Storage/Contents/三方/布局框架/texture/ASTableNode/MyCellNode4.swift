//
//  MyCellNode4.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode4: ASCellNode {
    
    // 头像
    let headImageNode = ASImageNode()
    
//    private lazy var headImageNode: ASDisplayNode = {
//        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
//            let imageView = UIImageView()
//            return imageView
//        })
//        return node
//    }()
    
    
    // 标题
    let titleNode = ASTextNode()
    // 副标题
    let subtitleNode = ASTextNode()
    
    override init() {
        super.init()
        
        //headImageNode.contentMode = .scaleAspectFill
        headImageNode.image = UIImage.init(named: "qbl")
        
        titleNode.attributedText = NSAttributedString.attributedString(string: "title", fontSize: 20, color: .black)
        subtitleNode.attributedText = NSAttributedString.attributedString(string: "subtitle", fontSize: 12, color: .gray)
        
        addSubnode(headImageNode)
        addSubnode(titleNode)
        addSubnode(subtitleNode)
    }
    
//    override func layout() {
//        headImageNode.forcedSize = CGSize.init(width: 80, height: 80)
//    }
    
    // 左边图片
    // 一个主标题
    // 一个副标题
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let titleLayout = ASStackLayoutSpec.init()
        titleLayout.direction = .vertical
        titleLayout.spacing = 20
        titleLayout.children = [titleNode, subtitleNode]
        
        // 头像使用绝对布局
        // layoutPosition相当于frame的origin
        headImageNode.style.layoutPosition = CGPoint.init(x: 10, y: 10)
        headImageNode.style.preferredSize = CGSize.init(width: 80, height: 80)
        let headImageLayout = ASAbsoluteLayoutSpec.init()
        headImageLayout.children = [headImageNode]
        
        let totalLayout = ASStackLayoutSpec.init()
        totalLayout.direction = .horizontal
        totalLayout.spacing = 40
        totalLayout.children = [headImageLayout, titleLayout]
        
        return ASInsetLayoutSpec.init(insets: .init(top: 10, left: 20, bottom: 10, right: 20), child: totalLayout)
    }
}
