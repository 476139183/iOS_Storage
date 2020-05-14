//
//  MyStackNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MyStackNode: ASCellNode {
    
    private lazy var labelNode1: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "label1", font: .systemFont(ofSize: 20), color: .red)
        label.backgroundColor = .green
        return label
    }()
    
    private lazy var voteNode: VoteNode = {
        let node = VoteNode.init(items: ["heh", "ss", "ui"])
        return node
    }()
    
    private lazy var labelNode2: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "label2", font: .systemFont(ofSize: 22), color: .blue)
        label.backgroundColor = .orange
        return label
    }()
    
    override init() {
        super.init()
    }
    
    override func didLoad() {
        super.didLoad()
        
        addSubnode(labelNode1)
        addSubnode(voteNode)
        addSubnode(labelNode2)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        labelNode1.style.preferredSize = .init(width: 200, height: 30)
        // 不需要计算voteNode的size了
        //voteNode.style.preferredSize = .init(width: 100, height: 100)
        labelNode2.style.preferredSize = .init(width: 300, height: 40)
        
        let layout = ASStackLayoutSpec.init()
        layout.direction = .vertical
        layout.spacing = 10
        layout.justifyContent = .start
        layout.alignItems = .center
        layout.children = [labelNode1, voteNode, labelNode2]
        
        return layout
    }

}

fileprivate class VoteNode: ASDisplayNode {
    
    private var items: [String] = []
    
    private lazy var contentNode: ASDisplayNode = {
        let node = ASDisplayNode.init { () -> UIView in
            let view = VoteView()
            return view
        }
        return node
    }()
    
    init(items: [String]) {
        super.init()
        
        self.items = items
    }
    
    override func didLoad() {
        super.didLoad()
        
        addSubnode(contentNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec.init()
        layout.child = contentNode
        let height: CGFloat = CGFloat(items.count * 50)
        // 这里决定size
        layout.style.preferredSize = .init(width: screenWidth, height: height)
        return layout
    }
    
}

fileprivate class VoteView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
