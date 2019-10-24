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
    
    deinit {
        print("释放")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "tableView"
        
        self.node.dataSource = self
        self.node.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        //self.node.frame = CGRect.init(x: 20, y: 120, width: 300, height: 400)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    // MARK: - ASTableDataSource
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        
        let a = indexPath.section % 8
        
        switch a {
        case 0:
            return MyCellNode.init(title: String(indexPath.section / 8), desc: "详情")
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
        case 6:
            return MyCellNode7()
        case 7:
            let cell = CommunityMessagePKCell(countdown: 600, truePoints: 10, falsePoints: 50, myPoints: 666)
            return cell
        default:
            return ASCellNode()
        }
        
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 100
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
