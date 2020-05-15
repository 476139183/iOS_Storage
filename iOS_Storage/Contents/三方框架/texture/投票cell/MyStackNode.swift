//
//  MyStackNode.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class MyStackNode: ASCellNode {
    
    private var items: [VoteModel] = []
    
    private lazy var labelNode1: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "label1", font: .systemFont(ofSize: 20), color: .red)
        label.backgroundColor = .green
        return label
    }()
    
    private lazy var voteNode: VoteNode = {
        let node = VoteNode.init(items: items)
        return node
    }()
    
    private lazy var labelNode2: ASTextNode = {
        let label = ASTextNode()
        label.attributedText = NSAttributedString.attributedString(string: "label2", font: .systemFont(ofSize: 22), color: .blue)
        label.backgroundColor = .orange
        return label
    }()
    
    init(items: [VoteModel]) {
        super.init()
        
        self.items = items
    }
    
    override func didLoad() {
        super.didLoad()
        
        backgroundColor = .white
        
        addSubnode(labelNode1)
        addSubnode(voteNode)
        addSubnode(labelNode2)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        labelNode1.style.preferredSize = .init(width: 200, height: 30)
        // 不需要计算voteNode的size了
        //voteNode.style.preferredSize = .init(width: 100, height: 100)
        labelNode2.style.preferredSize = .init(width: 300, height: 40)
        
        let layout = ASStackLayoutSpec.init()
        layout.direction = .vertical
        layout.spacing = 10
        layout.justifyContent = .start
        layout.alignItems = .center
        layout.children = [labelNode1, voteNode, labelNode2]
        
        return layout
    }

}

fileprivate class VoteNode: ASDisplayNode {
    
    private var items: [VoteModel] = []
    
    private lazy var contentNode: ASDisplayNode = {
        let node = ASDisplayNode.init { () -> UIView in
            let view = VoteView.init(items: self.items)
            return view
        }
        return node
    }()
    
    init(items: [VoteModel]) {
        super.init()
        
        var hasVoted = false
        var totalVoteCount: Float = 0
        items.forEach { (item) in
            totalVoteCount += Float(item.count)
            if item.isVote {
                hasVoted = true
            }
        }
        items.forEach { (item) in
            item.shouldShowVoteCount = hasVoted
            item.ratio = Float(item.count) / totalVoteCount
        }
        
        self.items = items
    }
    
    override func didLoad() {
        super.didLoad()
        
        addSubnode(contentNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec.init()
        layout.child = contentNode
        let height: CGFloat = CGFloat(items.count*42+16)
        // 这里决定size，整个node的size
        layout.style.preferredSize = .init(width: screenWidth-32, height: height)
        return layout
    }
    
}


// MARK: - Model

class VoteModel {
    
    var title: String = ""
    var count: Int = 0
    // 用户是否投了这个
    var isVote = false
    
    // 比例
    var ratio: Float = 0.0
    // 是否展示票数，投了才展示，没投不展示
    var shouldShowVoteCount = false
    
    init(title: String, count: Int, isVote: Bool) {
        self.title = title
        self.count = count
        self.isVote = isVote
    }
    
}


// MARK: - Cell

fileprivate class VoteCell: UITableViewCell {
    
    var model: VoteModel? {
        didSet {
            guard let model = model else {
                return
            }
            titleLabel.text = model.title
            countLabel.text = "\(model.count)票"
            ratioLabel.text = String(format: "%.0f", model.ratio*100) + "%"
            
            // 展示投票数
            if model.shouldShowVoteCount {
                countLabel.isHidden = false
                ratioLabel.isHidden = false
                checkedLabel.isHidden = false
                if model.isVote {
                    checkedLabel.isHidden = false
                    titleLabel.textColor = UIColor.colorWithHexString("#4F6C8F")
                    ratioView.backgroundColor = UIColor.colorWithHexString("#BDD3EC")
                } else {
                    checkedLabel.isHidden = true
                    titleLabel.textColor = UIColor.colorWithHexString("#696E82")
                    ratioView.backgroundColor = UIColor.colorWithHexString("#D1D7E1")
                }
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.snp.remakeConstraints { (make) in
                        make.left.equalTo(8)
                        make.centerY.equalToSuperview()
                    }
                    self.ratioView.snp.remakeConstraints { (make) in
                        make.left.top.bottom.equalToSuperview()
                        make.width.equalTo(self.containerView.snp.width).multipliedBy(model.ratio)
                    }
                    self.containerView.layoutIfNeeded()
                })
            } else { // 不展示投票数
                countLabel.isHidden = true
                ratioLabel.isHidden = true
                checkedLabel.isHidden = true
                titleLabel.textColor = UIColor.colorWithHexString("#6985A8")
                //ratioView.backgroundColor = .clear
                UIView.animate(withDuration: 0.2) {
                    self.titleLabel.snp.remakeConstraints { (make) in
                        make.center.equalToSuperview()
                    }
                    self.ratioView.snp.remakeConstraints { (make) in
                        make.left.top.bottom.equalToSuperview()
                        make.width.equalTo(0)
                    }
                    self.containerView.layoutIfNeeded()
                }
            }
            
        }
    }
    
    
    private let containerWidth: CGFloat = screenWidth - 32 - 24
    private let containerHeight: CGFloat = 34
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.colorWithHexString("#97A7BF").cgColor
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    /// 投票标签label
    private lazy var checkedLabel: UILabel = {
        let label = UILabel()
        label.font = IconFont.font(size: 16)
        label.text = IconFont.VoteCheck
        label.textColor = UIColor.colorWithHexString("#547395")
        return label
    }()
    
    private lazy var ratioView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    /// 投票数
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.colorWithHexString("#8EA8C6")
        label.isHidden = true // 默认隐藏
        label.textAlignment = .right
        return label
    }()
    
    /// 投票比例
    private lazy var ratioLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.colorWithHexString("#4F6C8F")
        label.isHidden = true // 默认隐藏
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = UIColor.colorWithHexString("#EDF1F7")
        
        contentView.addSubview(containerView)
        containerView.frame = .init(x: 0, y: 0, width: containerWidth, height: containerHeight)
        
        containerView.addSubview(ratioView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(checkedLabel)
        containerView.addSubview(countLabel)
        containerView.addSubview(ratioLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        // 投票标记
        checkedLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(4)
        }
        
        // 比例
        ratioLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
        
        // 票数
        countLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-41)
        }
        
    }
    
}


// MARK: - View

fileprivate class VoteView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    private var items: [VoteModel] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.backgroundColor = UIColor.colorWithHexString("#EDF1F7")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    init(items: [VoteModel]) {
        super.init(frame: .zero)
        self.items = items
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        backgroundColor = .white
        
        // 灰色背景view
        let grayBgView = UIView()
        addSubview(grayBgView)
        grayBgView.backgroundColor = UIColor.colorWithHexString("#EDF1F7")
        grayBgView.layer.cornerRadius = 6
        let grayBgViewHeight = 42*items.count+16
        grayBgView.frame = .init(x: 0, y: 0, width: Int(screenWidth)-32, height: grayBgViewHeight)
        
        grayBgView.addSubview(tableView)
        tableView.frame = .init(x: 12, y: 12, width: Int(grayBgView.width())-24, height: grayBgViewHeight-12)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as? VoteCell
        if cell == nil {
            cell = VoteCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.model = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        if item.isVote {
            // 取消投票
            item.isVote = false
            item.count -= 1
        } else {
            // 投票
            item.isVote = true
            item.count += 1
        }
        
        // 总票数
        var totalVoteCount: Float = 0.0
        // 是否展示票数
        var shouldShowVoteCount = false
        items.forEach { (item) in
            totalVoteCount += Float(item.count)
            // 只要有投票，就展示票数
            if item.isVote == true {
                shouldShowVoteCount = true
            }
        }
        
        items.forEach { (item) in
            item.shouldShowVoteCount = shouldShowVoteCount
            item.ratio = Float(item.count) / totalVoteCount
        }
        
        tableView.reloadData()
        
    }
    
}

