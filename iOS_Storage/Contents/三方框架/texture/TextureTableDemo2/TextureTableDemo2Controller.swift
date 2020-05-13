//
//  TextureTableDemo2Controller.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TextureTableDemo2Controller: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    
    private lazy var naviNode: ASDisplayNode = {
        return ASDisplayNode.init { () -> UIView in
            let naviView = CQBaseNaviBar()
            naviView.titleLabel.text = "TextureTableDemo2"
            naviView.detailButton.isHidden = true
            return naviView
        }
    }()
    
    private var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    
    init() {
        super.init(node: ASTableNode.init(style: .plain))
        
        tableNode.dataSource = self
        tableNode.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        node.backgroundColor = .white
        
        node.addSubnode(naviNode)
        node.addSubnode(tableNode)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        naviNode.view.frame = .init(x: 0, y: 0, width: screenWidth, height: kNavigationBarHeight)
        tableNode.frame = .init(x: 0, y: kNavigationBarHeight, width: screenWidth, height: screenHeight-kNavigationBarHeight)
    }
    
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = MyStackNode()
        return cell
    }

}
