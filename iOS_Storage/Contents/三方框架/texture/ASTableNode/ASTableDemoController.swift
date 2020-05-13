//
//  ASTableDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ASTableDemoController: ASViewController<ASTableNode>, ASTableDataSource, ASTableDelegate {
    
    /// 导航栏
    private lazy var naviNode: BaseNaviNode = {
        let node = BaseNaviNode()
        node.backgroundColor = .orange
        return node
    }()
    
    /// 表头
    private lazy var tableHeaderView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .red
        let label = UILabel()
        headerView.addSubview(label)
        label.text = "高度自适应的表头"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        headerView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
        }
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 90, left: 0, bottom: 90, right: 0))
        }
        return headerView
    }()
    
    /// 表尾
    private lazy var mytableFooterView: UIView = {
        let footerView = UIView()
        footerView.backgroundColor = .green
        let label = UILabel()
        footerView.addSubview(label)
        label.text = "高度自适应的表尾"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        footerView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
        }
        label.snp.makeConstraints { (make) in
            //make.edges.equalTo(UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0))
            make.top.equalTo(30)
            make.bottom.equalToSuperview().offset(-30)
            make.left.right.equalToSuperview()
        }
        return footerView
    }()
    
    // MARK: - Life Cycle
    
    init() {
        super.init(node: ASTableNode.init(style: .grouped))
    }
    
    deinit {
        self.node.delegate = nil
        self.node.dataSource = nil
        print("释放")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "tableView"
        
        self.view.backgroundColor = .white
        
        node.addSubnode(naviNode)
        
        self.node.dataSource = self
        self.node.delegate = self
        
        self.node.view.estimatedRowHeight = 50
        self.node.view.estimatedSectionHeaderHeight = 40
        self.node.view.estimatedSectionFooterHeight = 40
        
        self.node.view.tableHeaderView = tableHeaderView
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 100))
        footerView.backgroundColor = .green
        self.node.view.tableFooterView = footerView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        if let indexPath = self.node.indexPathForSelectedRow {
            self.node.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
        self.naviNode.frame = .init(x: 0, y: 0, width: screenWidth, height: kNavigationBarHeight)
        self.node.frame = CGRect.init(x: 0, y: kNavigationBarHeight, width: screenWidth, height: screenHeight-kNavigationBarHeight)
    }
    
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseID = "reuseID"
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID) as? HeaderView
        if header == nil {
            header = HeaderView()
        }
        header?.title = "组头 第\(section)组 高度自适应"
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let reuseID = "reuseID"
        var footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseID) as? FooterView
        if footer == nil {
            footer = FooterView()
        }
        footer?.title = "组尾 第\(section)组 高度自适应"
        return footer
    }
    
    // MARK: - ASTableDataSource
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        
        return MyCellNode.init(title: String(indexPath.section / 8), desc: "详情")
        
//        let a = indexPath.section % 8
//
//        switch a {
//        case 0:
//            return MyCellNode.init(title: String(indexPath.section / 8), desc: "详情")
//        case 1:
//            return MyCellNode2()
//        case 2:
//            return MyCellNode3()
//        case 3:
//            return MyCellNode4()
//        case 4:
//            return MyCellNode5()
//        case 5:
//            return MyCellNode6()
//        case 6:
//            return MyCellNode7()
//        case 7:
//            let cell = CommunityMessagePKCell(countdown: 600, truePoints: 10, falsePoints: 50, myPoints: 666)
//            return cell
//        default:
//            return ASCellNode()
//        }
        
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 100
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}


// MARK: - 组头 & 组尾

fileprivate class HeaderView: UITableViewHeaderFooterView {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .purple
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


fileprivate class FooterView: UITableViewHeaderFooterView {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemPink
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
