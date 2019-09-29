//
//  CommunityMessagePKCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/27.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CommunityMessagePKCell: ASCellNode {
    
    private lazy var cellContentNode: ASDisplayNode = {
        let node = ASDisplayNode.init(viewBlock: { () -> UIView in
            let view = PKCellContentView()
            return view
        })
        return node
    }()
    
    /// node的内容view
    private var contentView: PKCellContentView {
        get {
            return (self.cellContentNode.view as? PKCellContentView)!
        }
    }
    
    init(countdown: Int, truePoints: Int, falsePoints: Int, myPoints: Int) {
        super.init()
        
        addSubnode(cellContentNode)
        
        // 倒计时
        self.contentView.countdown = countdown
        // 真 积分
        self.contentView.truePoints = truePoints
        // 假 积分
        self.contentView.falsePoints = falsePoints
        // 我的积分
        self.contentView.myPoints = myPoints
        
        // 开始倒计时
        self.contentView.startCountdown()
        
        // 设置真积分所占比例
        self.contentView.configRatio()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASAbsoluteLayoutSpec()
        layout.child = cellContentNode
        layout.style.preferredSize = CGSize.init(width: screenWidth, height: 133)
        return layout
    }
    
}


fileprivate class PKCellContentView: UIView {
    
    /// 剩余倒计时
    var countdown: Int? {
        didSet {
            if let count = self.countdown {
                // 分钟
                let min = count / 60
                // 秒
                let sec = count % 60
                
                let title = NSString.init(format: "距离结束 %.2d:%.2d", min, sec)
                self.countDownButton.setTitle(title as String, for: .normal)
            }
        }
    }
    
    /// 真 积分
    var truePoints: Int? {
        didSet {
            self.truePointLabel.text = "\(self.truePoints ?? 0)积分"
        }
    }
    
    /// 假 积分
    var falsePoints: Int? {
        didSet {
            self.falsePointLabel.text = "\(self.falsePoints ?? 0)积分"
        }
    }
    
    /// 我的积分
    var myPoints: Int? {
        didSet {
            self.myPointLabel.text = "我的积分：\(self.myPoints ?? 0)"
        }
    }
    
    // MARK: Lazy
    
    /// 内容view
    private lazy var contentView: CQGradientView = {
        let view = CQGradientView.init(colors: [UIColor.colorWithHexString("#88B4FF"), UIColor.colorWithHexString("#7D75FE")], direction: CQGradientDirection.leftBottomToRightTop)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    /// 顶部view
    private lazy var topBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return view
    }()
    
    /// 底部view
    private lazy var bottomBgView: UIView = {
        let view = UIView()
        return view
    }()
    
    /// 倒计时label
    private lazy var countDownButton: CQCountDownButton = {
        let button = CQCountDownButton.init()
        button.isUserInteractionEnabled = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(UIColor(red: 0.31, green: 0.31, blue: 0.7, alpha: 1), for: .normal)
        return button
    }()
    
    /// “真”积分label
    private lazy var truePointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    /// “假”积分label
    private lazy var falsePointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var trueButton: GradientButton = {
        let button = GradientButton.init(colors: [UIColor.colorWithHexString("#F487E7"), UIColor.colorWithHexString("#B35DF9")], direction: .leftBottomToRightTop)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitle("真", for: .normal)
        button.addTarget(self, action: #selector(trueButtonClicked), for: .touchUpInside)
        return button
    }()
    
    /// "假"按钮
    private lazy var falseButton: UIButton = {
        let button = UIButton.init()
        button.backgroundColor = UIColor.colorWithHexString("#DFE2E6")
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.setTitle("假", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.colorWithHexString("#6A6F80"), for: .normal)
        button.addTarget(self, action: #selector(falseButtonClicked), for: .touchUpInside)
        return button
    }()
    
    /// pK bar
    private lazy var pkBarView: PKBarView = {
        let view = PKBarView()
        return view
    }()
    
    /// 我的积分label
    private lazy var myPointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: UI
    
    func setupUI() {
        
        addSubview(contentView)
        contentView.addSubview(topBgView)
        contentView.addSubview(bottomBgView)
        topBgView.addSubview(countDownButton)
        bottomBgView.addSubview(truePointLabel)
        bottomBgView.addSubview(falsePointLabel)
        bottomBgView.addSubview(pkBarView)
        bottomBgView.addSubview(trueButton)
        bottomBgView.addSubview(falseButton)
        bottomBgView.addSubview(myPointLabel)
        
        // 主内容view
        contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        // 顶部颜色渐变view
        topBgView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(26)
        }
        
        // 底部颜色渐变view
        bottomBgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topBgView.snp.bottom)
        }
        
        // 倒计时label
        countDownButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // “真”积分label
        truePointLabel.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(12)
            make.left.equalToSuperview()
            make.right.equalTo(bottomBgView.snp.centerX)
        }
        
        // “假”积分label
        falsePointLabel.snp.makeConstraints { (make) in
            make.top.height.equalTo(truePointLabel)
            make.right.equalToSuperview()
            make.left.equalTo(bottomBgView.snp.centerX)
        }
        
        // "真"按钮
        trueButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 50, height: 50))
            make.left.equalTo(6)
            make.top.equalTo(truePointLabel.snp.bottom)
        }
        
        // "假"按钮
        falseButton.snp.makeConstraints { (make) in
            make.size.top.equalTo(trueButton)
            make.right.equalToSuperview().offset(-6)
        }
        
        // pk bar
        pkBarView.snp.makeConstraints { (make) in
            make.centerY.equalTo(trueButton)
            make.height.equalTo(20)
            make.left.equalTo(trueButton.snp.right).offset(-5)
            make.right.equalTo(falseButton.snp.left).offset(5)
        }
        
        // 我的积分
        myPointLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(trueButton.snp.bottom).offset(5)
        }
    }
    
    
    // MARK: action
    
    // 真 按钮点击
    @objc func trueButtonClicked() {
        // 积分是否充足
        
        if myPoints ?? 0 <= 5 {
            return
        }
        
        self.truePoints = self.truePoints! + 5
        self.myPoints = self.myPoints! - 5
        
        // 动画
        showAnimationOnView(trueButton)
        // 重新设置比例
        configRatio()
    }
    
    // 假 按钮点击
    @objc func falseButtonClicked() {
        // 请求数据
        
        self.falsePoints = self.falsePoints! + 5
        self.myPoints = self.myPoints! - 5
        
        // 动画
        showAnimationOnView(falseButton)
        // 重新设置比例
        configRatio()
    }
    
    // 按钮点击动画
    func showAnimationOnView(_ view: UIView) {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.text = "-5"
        bottomBgView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp.top).offset(-5)
        }
        
        label.layoutIfNeeded()
        UIView.animate(withDuration: 1.5, animations: {
            label.alpha = 0
            label.top = label.top - 20
        }) { (finish) in
            label.removeFromSuperview()
        }
        
    }
    
    /// 倒计时
    func startCountdown() {
        guard self.countdown ?? 0 > 0 else {
            return
        }
        self.countDownButton.configDuration(UInt(self.countdown ?? 0), buttonClicked: nil, countDownStart: nil, countDownUnderway: { [weak self] (restCount) in
            self?.countdown = restCount
        }) { [weak self] in
            self?.countDownButton.setTitle("已结束", for: .normal)
            self?.trueButton.isUserInteractionEnabled = false
            self?.falseButton.isUserInteractionEnabled = false
        }
        // 启动倒计时
        self.countDownButton.startCountDown()
    }
    
    // 设置“真”积分所占比例
    func configRatio() {
        if let tP = truePoints, let fP = falsePoints {
            self.pkBarView.ratio = Float(tP) / Float(tP + fP)
        }
    }
}


fileprivate class PKBarView: UIView {
    
    /// 进度条
    private lazy var bar: CQGradientView = {
        let view = CQGradientView.init(colors: [UIColor.colorWithHexString("#F487E7"), UIColor.colorWithHexString("#B35DF9")], direction: .leftBottomToRightTop)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    /// 比例
    var ratio: Float? {
        didSet {
            bar.snp.updateConstraints { (make) in
                make.width.equalTo(Float(screenWidth-126) * (self.ratio ?? 0))
            }
        }
    }
    
    private lazy var vsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "vs_icon")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor(red:0.89, green:0.89, blue:1.00, alpha:1.00)
        
        addSubview(bar)
        addSubview(vsImageView)
        
        bar.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(2)
            make.bottom.equalToSuperview().offset(-2)
            make.width.equalTo(0)
        }
        
        vsImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 54, height: 54))
        }
    }
    
}
