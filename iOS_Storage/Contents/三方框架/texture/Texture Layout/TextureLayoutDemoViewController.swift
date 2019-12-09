//
//  TextureLayoutDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/2.
//  Copyright © 2019 蔡强. All rights reserved.
//

// 两个概念
// 1. Layout Specs（布局规则）
// 2. Layout Elements（布局元素，specs也是元素）



import UIKit


// MARK: - Controller

class TextureLayoutDemoViewController: ASViewController<ASDisplayNode>, UINavigationControllerDelegate, ASTableDataSource, ASTableDelegate {
    
    private lazy var dataArray: [Model] = {
        return [Model(title: "WrapperLayout", targetVC: ASWrapperLayoutController()),
                Model(title: "StackLayout", targetVC: ASStackLayoutController()),
                Model(title: "InsetLayout", targetVC: ASInsetLayoutController()),
                Model(title: "OverlayLayout", targetVC: ASOverlayLayoutController()),
                Model(title: "BackgroundLayout", targetVC: ASBackgroundLayoutController()),
                Model(title: "CenterLayout", targetVC: ASCenterLayoutController()),
                Model(title: "RatioLayout", targetVC: ASRatioLayoutController()),
                Model(title: "RelativeLayout", targetVC: ASRelativeLayoutController()),
                Model(title: "AbsoluteLayout", targetVC: ASAbsoluteLayoutController())]
    }()
    
    private lazy var tableNode: ASTableNode = {
        let tableNode = ASTableNode()
        tableNode.dataSource = self
        tableNode.delegate = self
        return tableNode
    }()
    
    private lazy var naviNode: TextureLayoutDemoNaviNode = {
        let naviView = TextureLayoutDemoNaviNode()
        naviView.backClosure = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        return naviView
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
        
        self.navigationController?.delegate = self
        
        
        node.addSubnode(naviNode)
        node.addSubnode(tableNode)
    }
    
    override func viewWillLayoutSubviews() {
        naviNode.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavigationBarHeight)
        tableNode.frame = CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kScreenHeight - kNavigationBarHeight - kTabBarHeight)
    }
    
    
    // MARK: - TableView DataSource & Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let isHideNaviBar = viewController.isMember(of: TextureLayoutDemoViewController.self)
        self.navigationController?.setNavigationBarHidden(isHideNaviBar, animated: animated)
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = ASTextCellNode()
        cell.text = dataArray[indexPath.row].title
        return cell
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(dataArray[indexPath.row].targetVC!, animated: true)
    }

}


// MARK: - Model

fileprivate struct Model {
    var title: String?
    var targetVC: UIViewController?
}
