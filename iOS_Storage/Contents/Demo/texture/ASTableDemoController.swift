//
//  ASTableDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ASTableDemoController: ASViewController<ASTableNode>, ASTableDataSource, ASTableDelegate {
    
    init() {
        super.init(node: ASTableNode.init(style: .grouped))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "tableView"
        
        self.node.dataSource = self
        self.node.delegate = self
        
        
    }
    
    override func viewWillLayoutSubviews() {
        self.node.frame = CGRect.init(x: 20, y: 120, width: 300, height: 400)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    // MARK: - ASTableDataSource
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
//        return ASCellNode.init(viewBlock: { () -> UIView in
//            let view = UIView()
//            view.backgroundColor = .red
//            view.frame = CGRect.init(x: 0, y: 0, width: 300, height: 30)
//            return view
//        })
        
        let a = indexPath.section % 6
        
        switch a {
        case 0:
            return MyCellNode.init(title: String(indexPath.section), desc: "详情")
        case 1:
            return MyCellNode2()
        case 2:
            return MyCellNode3()
        case 3:
            return MyCellNode4()
        case 4:
            return MyCellNode5()
        case 5:
            return MyCellNode6()
        default:
            return ASCellNode()
        }
        
        
        
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 20
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
