//
//  MyCellNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode: ASCellNode {
    
    let titleNode = ASTextNode()
    let descriptionNode = ASTextNode()
    let buttonNode = ASButtonNode()
    
    init(title: String, desc: String) {
        super.init()
        
        self.backgroundColor = .orange
        self.automaticallyManagesSubnodes = true
        
        titleNode.attributedText = NSAttributedString.attributedString(string: title, fontSize: 16, color: .black)
        descriptionNode.attributedText = NSAttributedString.attributedString(string: desc, fontSize: 16, color: .black)
        buttonNode.setTitle("button", with: .boldSystemFont(ofSize: 20), with: .green, for: .normal)
        buttonNode.addTarget(self, action: #selector(buttonClicked), forControlEvents: .touchUpInside)
    }
    
    override init() {
        super.init()
        self.backgroundColor = .orange
        
        // A boolean that shows whether the node automatically inserts and removes nodes based on the presence or absence of the node and its subnodes is completely determined in its layoutSpecThatFits: method.
        self.automaticallyManagesSubnodes = true
        
//        let label = UILabel()
//        self.view.addSubview(label)
//        label.text = "ddddddddddddddddddddddd"
//        label.numberOfLines = 0
//        label.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        
        titleNode.attributedText = NSAttributedString.attributedString(string: "title", fontSize: 16, color: .black)
        descriptionNode.attributedText = NSAttributedString.attributedString(string: "desc", fontSize: 16, color: .black)
        buttonNode.setTitle("button", with: .boldSystemFont(ofSize: 20), with: .green, for: .normal)
        buttonNode.addTarget(self, action: #selector(buttonClicked), forControlEvents: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        print("button 点击")
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let verticalStackSpec = ASStackLayoutSpec.vertical()
        verticalStackSpec.alignItems = .start
        verticalStackSpec.spacing = 5.0
        verticalStackSpec.children = [titleNode, descriptionNode]
        
        let vStackSpec = ASStackLayoutSpec.horizontal()
        vStackSpec.alignItems = .start
        vStackSpec.spacing = 0
        vStackSpec.children = [verticalStackSpec, buttonNode]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 36, bottom: 2, right: 10), child: vStackSpec)
    }
}
