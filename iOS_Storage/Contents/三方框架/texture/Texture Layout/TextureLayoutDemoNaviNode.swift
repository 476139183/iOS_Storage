//
//  TextureLayoutDemoNaviNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureLayoutDemoNaviNode: ASDisplayNode {

    /// 返回按钮点击回调
    var backClosure: (() -> ())?
    
    
    // MARK: - Lazy
    
    private lazy var contentNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .orange
        return node
    }()
    
    /// 标题
    private lazy var titleNode: ASTextNode = {
        let titleNode = ASTextNode()
        titleNode.attributedText = NSAttributedString.attributedString(string: "Texture Layout", font: .boldSystemFont(ofSize: 16), color: .black)
        return titleNode
    }()
    
    /// 返回按钮
    private lazy var backNode: ASButtonNode = {
        let backNode = ASButtonNode()
        backNode.backgroundColor = .blue
        //backNode.setTitle("返回", with: .boldSystemFont(ofSize: 14), with: .blue, for: .normal)
        backNode.titleNode.attributedText = NSAttributedString.attributedString(string: "back", fontSize: 20, color: .black)
        backNode.addTarget(self, action: #selector(backButtonClicked), forControlEvents: .touchUpInside)
        return backNode
    }()
    
    
    // MARK: - Life Cycle
    
    override func didLoad() {
        addSubnode(contentNode)
        
        contentNode.addSubnode(titleNode)
        contentNode.addSubnode(backNode)
    }
    
    // 该方法定义了节点的布局，
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let insets = UIEdgeInsets(top: kStatusBarHeight, left: 0, bottom: 0, right: 0)
        let insetsLayout = ASInsetLayoutSpec(insets: insets, child: contentNode)
        
        
        
        return insetsLayout
    }
    
    override func layout() {
        backNode.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
    }
    
    
    // MARK: - action
    
    @objc private func backButtonClicked() {
        backClosure?()
    }
    
}
