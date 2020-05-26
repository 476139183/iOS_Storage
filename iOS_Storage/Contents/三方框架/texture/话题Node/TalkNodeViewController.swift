//
//  TalkNodeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/26.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit


class TalkNodeViewController: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    
    private lazy var naviView: CQBaseNaviBar = {
        let view = CQBaseNaviBar()
        view.titleLabel.text = self.title
        return view
    }()
    
    private lazy var tableNode: ASTableNode = {
        let table = ASTableNode()
        table.dataSource = self
        table.delegate = self
        return table
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
        
        view.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(naviHeight)
        }
        
        node.addSubnode(tableNode)
        tableNode.view.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviHeight)
        }
        
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return TalkCellNode()
    }

}
