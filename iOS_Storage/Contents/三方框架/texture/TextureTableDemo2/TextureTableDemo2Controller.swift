//
//  TextureTableDemo2Controller.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TextureTableDemo2Controller: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    
    private lazy var naviView: CQBaseNaviBar = {
        let view = CQBaseNaviBar()
        view.titleLabel.text = "table node 2"
        view.detailButton.isHidden = true
        view.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var tableNode: ASTableNode = {
        let table = ASTableNode.init(style: .grouped)
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
        
        node.backgroundColor = .white
        
        view.addSubview(naviView)
        naviView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
        node.addSubnode(tableNode)
        tableNode.view.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
        }
    }
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ASTableNode
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = MyStackNode()
        return cell
    }

}

class VoteModel {
    
    var title: String = ""
    var count: Int = 0
    // 用户是否投了这个
    var isVoted = false
    // 是否展示百分比，用户只要投了其中一票就展示
    var isShowRatio = false
    
    init(title: String, count: Int, isVoted: Bool) {
        self.title = title
        self.count = count
        self.isVoted = isVoted
    }
    
}
