//
//  CustomNodeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CustomNodeViewController: ASViewController<ASDisplayNode> {
    
    private lazy var naviNode: NaviNode = {
        let node = NaviNode()
        return node
    }()
    
    init() {
        super.init(node: ASDisplayNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        node.backgroundColor = .white
        
        self.node.addSubnode(naviNode)
        naviNode.frame = .init(x: 0, y: 0, width: kScreenWidth, height: kNavigationBarHeight)
        
        let textNode = ASTextNode2()
        self.node.addSubnode(textNode)
        
        let text = "this is a title"
        let attString = NSMutableAttributedString.init(string: text)
        let range = NSRange.init(location: 0, length: text.count)
        attString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        attString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        textNode.backgroundColor = .red
        
        textNode.attributedText = attString
        
        
        textNode.frame = .init(x: 50, y: 300, width: 300, height: 60)
        
    }
    
}

fileprivate class NaviNode: ASDisplayNode {
    
    private lazy var contentNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        return node
    }()
    
    private lazy var titleNode: ASTextNode2 = {
        let node = ASTextNode2()
        let title = "this is TextNode"
        let range = NSRange.init(location: 0, length: title.count)
        let attString: NSMutableAttributedString = NSMutableAttributedString.attributedString(string: title, font: .boldSystemFont(ofSize: 16), color: .black) as! NSMutableAttributedString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        node.attributedText = attString
        node.backgroundColor = .red
        return node
    }()
    
    override func didLoad() {
        backgroundColor = .orange
        
        addSubnode(contentNode)
        addSubnode(titleNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let titleInsetLayout = ASInsetLayoutSpec.init(insets: .init(top: 0, left: 80, bottom: 0, right: 80), child: titleNode)
        let insetLayout = ASInsetLayoutSpec.init(insets: .init(top: kStatusBarHeight, left: 0, bottom: 0, right: 0), child: titleInsetLayout)
        return insetLayout
    }
    
}
