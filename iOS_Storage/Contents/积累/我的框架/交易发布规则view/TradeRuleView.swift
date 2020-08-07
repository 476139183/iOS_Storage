//
//  TradeRuleView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TradeRuleView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "交易发布规则"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.colorWithHexString("#373D4D")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descTextView: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = UIColor.colorWithHexString("#6A6F80")
        view.isEditable = false
        if let filePath = Bundle.main.path(forResource: "trade_rule", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filePath)
                view.text = contents
            } catch {
                // 内容无法加载
            }
        } else {
            // 文件未找到
        }
        return view
    }()
    
    private lazy var readButton: CQCountDownButton = {
        let button = CQCountDownButton()
        button.backgroundColor = UIColor.colorWithHexString("#FF6C6C")
        button.layer.cornerRadius = 21
        button.setTitle("已阅读", for: .normal)
        return button
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
        readButton.configDuration(5, buttonClicked: nil, countDownStart: nil, countDownUnderway: { [weak self] (rest) in
            let title = "已阅读(\(rest)s)"
            self?.readButton.setTitle(title, for: .normal)
            self?.readButton.alpha = 0.6
        }) {
            self.readButton.addTarget(self, action: #selector(self.readButtonClicked), for: .touchUpInside)
            self.readButton.setTitle("已阅读", for: .normal)
            self.readButton.alpha = 1
        }
        readButton.startCountDown()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        isUserInteractionEnabled = true
        
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descTextView)
        contentView.addSubview(readButton)
        
        contentView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 315, height: 527))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        descTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.bottom.equalTo(readButton.snp.top).offset(-20)
            make.left.equalTo(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        readButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 120, height: 42))
            make.bottom.equalToSuperview().offset(-24)
        }
        
    }
    
    
    // MARK: - action
    
    @objc private func readButtonClicked() {
        self.removeFromSuperview()
    }
    
}
