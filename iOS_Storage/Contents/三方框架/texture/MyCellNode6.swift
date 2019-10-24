//
//  MyCellNode6.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class MyCellNode6: ASCellNode {
    // 包裹一个view
    private lazy var myContentNode: ASDisplayNode = {
        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
            let view = MyCellNode6Content()
            return view
        })
        return node
    }()
    
    override init() {
        super.init()
        
        addSubnode(myContentNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec()
        layout.style.preferredSize = CGSize.init(width: 300, height: 120)
        layout.child = myContentNode
        
        let insetLayout = ASInsetLayoutSpec.init(insets: .init(top: 8, left: 8, bottom: 8, right: 8), child: layout)
        
        return insetLayout
    }
}

fileprivate class MyCellNode6Content: UIView {
    
    let timeLabel = UILabel()
    let vsImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .yellow
        
        addSubview(timeLabel)
        addSubview(vsImageView)
        
        timeLabel.text = "距离结束 02:30"
        timeLabel.textColor = .blue
        timeLabel.backgroundColor = .orange
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        vsImageView.image = UIImage.init(named: "vs_icon")
        vsImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 80, height: 80))
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
        }
    }
}
