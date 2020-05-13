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
        
        return layout
    }
    
}
