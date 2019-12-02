//
//  NestedItemTextureController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class NestedItemTextureController: ASViewController<ASTableNode>, ASTableDataSource, ASTableDelegate, JXPagingViewListViewDelegate {
    
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    
    // MARK: - Life Cycle
    
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
    
//    override func viewWillLayoutSubviews() {
//        self.node.frame = view.bounds
//    }
    
    
    // MARK: - UITableView DataSource & Delegate
    
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
    
    
    // MARK: - UIScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
    
    
    // MARK: - JXPagingViewListView Delegate
    
    func listView() -> UIView {
        return node.view
    }
    
    func listScrollView() -> UIScrollView {
        return node.view
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }

}
