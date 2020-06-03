//
//  ASAbsoluteLayoutController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

// 绝对布局的使用方法和原生布局类似

import UIKit

class ASAbsoluteLayoutController: ASViewController<ASDisplayNode> {
    
    private lazy var myNode: MyNode = {
        let myNode = MyNode()
        return myNode
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
        
        node.addSubnode(myNode)
        
        node.backgroundColor = .orange
        
    }
    
    override func viewWillLayoutSubviews() {
        myNode.frame = CGRect(x: 111, y: 111, width: 111, height: 111)
    }

}


fileprivate class MyNode: ASDisplayNode {
    
    private lazy var label: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "label", font: .systemFont(ofSize: 20), color: .black)
        label.backgroundColor = .red
        return label
    }()
    
    override func didLoad() {
        addSubnode(label)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        label.style.layoutPosition = CGPoint(x: 45, y: 45)
        label.style.preferredSize = CGSize(width: 90, height: 90)
        return ASAbsoluteLayoutSpec(children: [label])
    }
    
}
