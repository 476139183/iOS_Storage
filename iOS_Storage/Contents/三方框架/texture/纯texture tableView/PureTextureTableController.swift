//
//  PureTextureTableController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PureTextureTableController: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    
    private lazy var naviNode: BaseNaviNode = {
        let navi = BaseNaviNode()
        let title = "纯texture table"
        let range = NSRange.init(location: 0, length: title.count)
        let att: NSMutableAttributedString = NSMutableAttributedString.attributedString(string: title, font: .boldSystemFont(ofSize: 16), color: .black) as! NSMutableAttributedString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        att.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        navi.titleNode.attributedText = att
        navi.titleNode.backgroundColor = .red
        navi.backClosure = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        return navi
    }()
    
    private lazy var tableNode: ASTableNode = {
        let table = ASTableNode()
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    // MARK: - Life Cycle
    
    init() {
        super.init(node: ASDisplayNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.node.backgroundColor = .white
        
        self.node.addSubnode(naviNode)
        self.node.addSubnode(tableNode)
        
        naviNode.frame = .init(x: 0, y: 0, width: kScreenWidth, height: kNavigationBarHeight)
        tableNode.frame = .init(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kScreenHeight-kNavigationBarHeight)
        
        
    }
    
    // MARK: - Table
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return ASCellNode()
    }

}
