//
//  BaseNaviNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BaseNaviNode: ASDisplayNode {
    
    var backClosure: (() -> ())?
    
    private lazy var backNode: ASButtonNode = {
        let node = ASButtonNode()
        node.imageNode.image = UIImage.init(named: "nav_back_icon")
        return node
    }()
    
    lazy var titleNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()

    override func didLoad() {
        super.didLoad()
        
        addSubnode(backNode)
        addSubnode(titleNode)
    }
    
    
    @objc private func backNodeClicked() {
        backClosure?()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec.init(children: [backNode, titleNode])
        
        titleNode.style.layoutPosition = .init(x: 80, y: statusBarHeight)
        titleNode.style.preferredSize = .init(width: screenWidth-160, height: naviBarHeight)
        
        backNode.style.layoutPosition = .init(x: 20, y: statusBarHeight+(naviBarHeight-18)/2)
        backNode.style.preferredSize = .init(width: 10, height: 18)
        
        layout.style.preferredSize = .init(width: screenWidth, height: kNavigationBarHeight)
        
        return layout
    }
    
}
