//
//  VoteCellNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class VoteCellNode: ASCellNode {
    
    private lazy var voteNode: ASDisplayNode = {
        let node = ASDisplayNode.init { () -> UIView in
            let view = VoteCellView()
            return view
        }
        return node
    }()
    
    private var bgColor = UIColor.white
    
    init(bgColor: UIColor) {
        super.init()
        
        self.bgColor = bgColor
    }
    
    override func didLoad() {
        super.didLoad()
        
        voteNode.backgroundColor = bgColor
        addSubnode(voteNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec.init(children: [voteNode])
        layout.style.preferredSize = .init(width: screenWidth, height: 100)
        return layout
    }

}

fileprivate class VoteCellView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "This is a label."
        label.backgroundColor = .orange
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .gray
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
}
