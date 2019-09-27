//
//  MyCellNode7.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode7: ASCellNode {
    
    private lazy var cellContentNode: ASDisplayNode = {
        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
            let view = nodeContentView()
            return view
        })
        return node
    }()
    
    override init() {
        super.init()
        
        addSubnode(cellContentNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec()
        layout.style.preferredSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: 100)
        layout.child = cellContentNode
        return layout
    }
}

fileprivate class nodeContentView: UIView {
    
    let label = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .purple
        
        addSubview(label)
        addSubview(button)
        
        label.text = "绝对布局"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        button.setTitle("button", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 100, height: 40))
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func buttonClicked() {
        print("click")
    }
}
