//
//  TextureNodeDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureNodeDemoViewController: ASViewController<ASDisplayNode>, NaviBarProtocol {
    
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private lazy var naviView: CQBaseNaviBar = {
        let view = CQBaseNaviBar()
        view.titleLabel.text = "各种node"
        view.detailButton.isHidden = true
        view.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return view
    }()
    
    /// 最基础的node
    private lazy var displayNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = .red
        return node
    }()
    
    /// 按钮
    private lazy var button: ASButtonNode = {
        let button = ASButtonNode()
        button.setTitle("未选中", with: .boldSystemFont(ofSize: 20), with: .black, for: .normal)
        button.setTitle("选中", with: .boldSystemFont(ofSize: 20), with: .red, for: .selected)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonClicked), forControlEvents: .touchUpInside)
        // 垂直方向布局(如果重写了layoutSpecThatFits，这两个属性将失效)
        button.contentVerticalAlignment = ASVerticalAlignment.top
        // 水平方向布局
        button.contentHorizontalAlignment = ASHorizontalAlignment.right
        
        return button
    }()
    
    /// label
    private lazy var label: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString(string: "呵呵")
        return label
    }()
    
    /// image
    private lazy var imageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage(named: "interesting")
        return imageNode
    }()
    
    // 这个是必须写的
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
        
        node.addSubnode(displayNode)
        displayNode.frame = CGRect(x: 20, y: 90, width: 30, height: 30)
        
        node.addSubnode(button)
        button.frame = CGRect(x: 60, y: 90, width: 100, height: 40)
        
        node.addSubnode(label)
        label.frame = CGRect(x: 170, y: 90, width: 90, height: 40)
        
        node.addSubnode(imageNode)
        imageNode.frame = CGRect(x: 20, y: 150, width: 90, height: 90)
    }
    
    
    // MARK: - action
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func buttonClicked() {
        button.isSelected = !button.isSelected
        print("click")
    }

}
