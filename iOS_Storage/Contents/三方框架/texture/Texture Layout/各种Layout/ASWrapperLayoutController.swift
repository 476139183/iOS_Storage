//
//  ASWrapperLayoutController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ASWrapperLayoutController: ASViewController<ASDisplayNode> {
    
    private lazy var myNode: MyNode = {
        let node = MyNode()
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
        
        node.addSubnode(myNode)
    }
    
    override func viewWillLayoutSubviews() {
        myNode.frame = CGRect(x: 90, y: 190, width: 100, height: 100)
    }

}


fileprivate class MyNode: ASDisplayNode {
    
    private lazy var label: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "red label", font: .systemFont(ofSize: 13), color: .black)
        label.maximumNumberOfLines = 0
        label.backgroundColor = .red
        return label
    }()
    
    override func didLoad() {
        backgroundColor = .orange
        
        addSubnode(label)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: label)
    }
    
}
