//
//  StackThreeTitlesViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StackThreeTitlesViewController: CQBaseViewController {
    
    private lazy var followButton: ItemButton = {
        let button = ItemButton()
        button.nameLabel.text = "关注"
        return button
    }()
    
    private lazy var fansButton: ItemButton = {
        let button = ItemButton()
        button.nameLabel.text = "被关注"
        return button
    }()
    
    private lazy var topicButton: ItemButton = {
        let button = ItemButton()
        button.nameLabel.text = "创建话题"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let stackView = UIStackView.init(arrangedSubviews: [followButton, fansButton, topicButton])
        view.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "点击赋值"
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        followButton.countLabel.text = "99"
        fansButton.countLabel.text = "5"
        topicButton.countLabel.text = "12"
    }
    
}

fileprivate class ItemButton: UIButton {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(nameLabel)
        addSubview(countLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(6)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
