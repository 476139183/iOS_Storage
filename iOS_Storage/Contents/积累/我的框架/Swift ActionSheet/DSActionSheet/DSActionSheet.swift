//
//  DSActionSheet.swift
//  DSActionSheet
//
//  Created by caiqiang on 2020/1/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

let defaultActionSheetTitleColor = UIColor.black
let defaultActionSheetTitleFont = UIFont.systemFont(ofSize: 16)

class DSActionSheet: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Public
    
    /// 快捷 show 方法
    /// - Parameter title:   标题
    /// - Parameter message: 描述
    /// - Parameter actions: 回调
    static func showWith(title: String?, message: String?, actions: [DSAlertAction]) {
        let sheet = DSActionSheet.init(title: title, message: message, actions: actions)
        sheet.show()
    }
    
    
    /// 常规 show 方法（类似 UIAlertController，先初始化，再 show）
    /// - Parameters:
    ///   - title:   标题
    ///   - message: 描述
    ///   - actions: 回调
    convenience init(title: String?, message: String?, actions: [DSAlertAction]) {
        self.init()
        self.actions = actions
        self.titleLabel.text = title
        self.messageLabel.text = message
    }
    
    /// 配合 init 方法，show 出来
    func show() {
        
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        
        window?.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        backgroundColor = UIColor.black.withAlphaComponent(0)
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.snp.bottom)
        }
        
        self.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self.contentView.snp.remakeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.snp.bottom)
            }
            self.layoutIfNeeded()
        }) { (finished) in
            // 添加一个透明 button，点击弹窗消失
            let dismissButton = UIButton()
            self.addSubview(dismissButton)
            dismissButton.backgroundColor = .clear
            dismissButton.addTarget(self, action: #selector(self.dissmiss), for: .touchUpInside)
            dismissButton.snp.makeConstraints { (make) in
                make.top.left.right.equalToSuperview()
                make.bottom.equalTo(self.contentView.snp.top)
            }
            // 添加一个遮挡底部圆角的 view
            let shelterView = UIView()
            self.addSubview(shelterView)
            shelterView.backgroundColor = UIColor.colorWithHexString("#F7F7F7")
            shelterView.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(12)
            }
        }
        
    }
    
    
    // MARK: - Private
    
    private var actions: [DSAlertAction] = []
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor.colorWithHexString("#373E4D")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor.colorWithHexString("#797F8C")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [self.titleLabel, self.messageLabel])
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalToSuperview().offset(-30)
        }
        self.messageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalToSuperview().offset(-30)
        }
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.addSubview(self.stackView)
        
        if let title = self.titleLabel.text, title != "" {
            self.titleLabel.isHidden = false
        } else {
            self.titleLabel.isHidden = true
        }
        
        if let message = self.messageLabel.text, message != "" {
            self.messageLabel.isHidden = false
        } else {
            self.messageLabel.isHidden = true
        }
        
        if self.titleLabel.isHidden, self.messageLabel.isHidden {
            self.stackView.snp.makeConstraints { (make) in
                make.left.right.top.bottom.equalToSuperview()
                make.height.equalTo(0)
            }
        } else {
            self.stackView.snp.makeConstraints { (make) in
                make.edges.equalTo(UIEdgeInsets.init(top: 16, left: 0, bottom: 16, right: 0))
            }
        }
        
        return headerView
    }()
    
    private lazy var footerView: UIView = {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.colorWithHexString("#F7F7F7")
        footerView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(48)
        }
        return footerView
    }()
    
    /// 取消按钮
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(UIColor.colorWithHexString("#373E4D"), for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        return cancelButton
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.addSubview(headerView)
        contentView.addSubview(tableView)
        contentView.addSubview(footerView)
        headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.height.equalTo(0)
        }
        footerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(tableView.snp.bottom)
            make.height.equalTo(tabbarHeight + 5)
            make.bottom.equalToSuperview()
        }
        return contentView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 58
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        return tableView
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 取消按钮点击
    @objc private func cancelButtonClicked() {
        dissmiss()
    }
    
    @objc private func dissmiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.contentView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.snp.bottom)
                make.left.right.equalToSuperview()
            }
            self.layoutIfNeeded()
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        var height = tableView.contentSize.height
        if height > 300 {
            height = 300
            tableView.isScrollEnabled = true
        } else {
            tableView.isScrollEnabled = false
        }
        tableView.snp.remakeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.height.equalTo(height)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? DSActionSheetCell
        if cell == nil {
            cell = DSActionSheetCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.action = actions[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actions[indexPath.row].handler?()
        dissmiss()
    }
    
}


// MARK: - Action Model

class DSAlertAction {
    
    typealias DSAlertActionHandler = (() -> ())
    
    /// 回调
    var handler: DSAlertActionHandler?
    
    var title: String?
    var titleColor = defaultActionSheetTitleColor
    var titleFont = defaultActionSheetTitleFont
    
    convenience init(title: String?, titleColor: UIColor = defaultActionSheetTitleColor, titleFont: UIFont = defaultActionSheetTitleFont, handler: @escaping DSAlertActionHandler) {
        self.init()
        
        self.title = title
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.handler = handler
    }
    
}



// MARK: - Cell

fileprivate class DSActionSheetCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var action: DSAlertAction? {
        didSet {
            guard let action = action else {
                return
            }
            titleLabel.text      = action.title
            titleLabel.textColor = action.titleColor
            titleLabel.font      = action.titleFont
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        
        let lineView = UIView()
        contentView.addSubview(lineView)
        lineView.backgroundColor = UIColor.colorWithHexString("#EBEBEB")
        lineView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 18, left: 12, bottom: 18, right: 12))
        }
    }
    
}
