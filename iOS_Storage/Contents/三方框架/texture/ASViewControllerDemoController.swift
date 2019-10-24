//
//  ASViewControllerDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ASViewControllerDemoController: ASViewController<ASDisplayNode> {
    
    // MARK: - Lazy
    
    /// colorNode
    private lazy var colorNode: ASDisplayNode = {
        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
            let view = TextureColorView()
            return view
        })
        return node
    }()
    
    /// 自适应的label
    private lazy var myTextNode: ASDisplayNode = {
        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
            let view = TextureLabelView()
            return view
        })
        return node
    }()
    
    // MARK: - Life Cycle
    
    init() {
        super.init(node: ASDisplayNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "ASViewController"
        
        setupUI()
    }
    
    deinit {
        print("deinit")
    }
    
    
    // MARK: - UI
    
    func setupUI() {
        
        self.node.addSubnode(colorNode)
        self.node.addSubnode(myTextNode)
        
        let colorView = colorNode.view
        let textView = myTextNode.view as? TextureLabelView
        
        colorView.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
        
        textView?.snp.makeConstraints { (make) in
            make.top.equalTo(colorView.snp.bottom).offset(20)
            make.centerX.equalTo(colorView)
            make.width.equalTo(100)
        }
        textView?.content = "自适应文本label。。。。。。。。。。。。。。。。。。。。。。。。大大大大大奥"
    }
    
}
