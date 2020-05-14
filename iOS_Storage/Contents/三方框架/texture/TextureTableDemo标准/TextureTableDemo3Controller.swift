//
//  TextureTableDemo3Controller.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TextureTableDemo3Controller: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    
    private lazy var naviView: CQBaseNaviBar = {
        let view = CQBaseNaviBar()
        view.detailButton.isHidden = true
        view.titleLabel.text = "ASTable demo 3"
        view.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var tableNode: ASTableNode = {
        let node = ASTableNode()
        node.dataSource = self
        node.delegate = self
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
        
        view.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
        node.addSubnode(tableNode)
        tableNode.view.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviView.snp.bottom)
        }
        
    }
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - ASTableNode
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return MyCellNode()
    }
    
}
