//
//  PopMenuView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/8.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PopMenuView: UIView {
    
    /// 更多按钮
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "community.more_icon"), for: .normal)
        button.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        return button
    }()
    
    /// 帖子按钮
    private var postButton: GradientButton!
    /// 鉴别按钮
    private var identifyButton: GradientButton!
    /// 交易按钮
    private var tradeButton: GradientButton!
    
    
    /// 半透明hud
    private lazy var hud: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.alpha = 0
        return view
    }()
    
    /// 是否是“更多”状态，对应的为关闭状态
    private var isMoreState = true
    
    
    // MARK: - 回调
    
    /// 帖子按钮点击回调
    var postButtonClickedClosuere: (() -> ())?
    /// 鉴别按钮点击回调
    var identifyButtonClickedClosuere: (() -> ())?
    /// 交易按钮点击回调
    var tradeButtonClickedClosure: (() -> ())?
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        
        // 创建 帖子 鉴别 交易 三个按钮
        for i in 0..<3 {
            let button = GradientButton()
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.frame = self.frame
            button.layer.cornerRadius = button.height / 2
            button.clipsToBounds = true
            button.alpha = 0
            
            switch i {
            case 0:
                self.postButton = button
                self.postButton.configWith(colors: [UIColor.colorWithHexString("#FBB794"), UIColor.colorWithHexString("#F16266")], direction: .leftTopToRightBottom)
                self.postButton.setTitle("帖子", for: .normal)
                self.postButton.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
            case 1:
                self.identifyButton = button
                self.identifyButton.configWith(colors: [UIColor.colorWithHexString("#F487E7"), UIColor.colorWithHexString("#B35DF9")], direction: .leftTopToRightBottom)
                self.identifyButton.setTitle("鉴别", for: .normal)
                self.identifyButton.addTarget(self, action: #selector(identifyButtonClicked), for: .touchUpInside)
            case 2:
                self.tradeButton = button
                self.tradeButton.configWith(colors: [UIColor.colorWithHexString("#88B4FF"), UIColor.colorWithHexString("#7D75FE")], direction: .leftTopToRightBottom)
                self.tradeButton.setTitle("交易", for: .normal)
                self.tradeButton.addTarget(self, action: #selector(tradeButtonClicked), for: .touchUpInside)
            default :
                break
            }
        }
        
        self.moreButton.frame = self.bounds
        
        addSubview(postButton)
        addSubview(identifyButton)
        addSubview(tradeButton)
        
        // 更多按钮在顶部
        addSubview(moreButton)
    }
    
    
    // MARK: - action
    
    @objc private func moreButtonClicked() {
        
        // 按钮不同状态执行不同方法
        if self.isMoreState {
            // 展开菜单
            show()
        } else {
            // 移除
            dismiss()
        }
        
    }
    
    /// 帖子按钮点击
    @objc private func postButtonClicked() {
        dismiss()
        if let closure = self.postButtonClickedClosuere {
            closure()
        }
    }
    
    /// 鉴别按钮点击
    @objc private func identifyButtonClicked() {
        dismiss()
        if let closure = self.identifyButtonClickedClosuere {
            closure()
        }
    }
    
    /// 交易按钮点击
    @objc private func tradeButtonClicked() {
        dismiss()
        if let closure = self.tradeButtonClickedClosure {
            closure()
        }
    }
    
    private func show() {
        
        self.superview?.insertSubview(hud, belowSubview: self)
        hud.frame = self.superview!.bounds
        
        moreButton.setImage(UIImage.init(named: "community.close_icon"), for: .normal)
        // 展开菜单
        UIView.animate(withDuration: 0.1) {
            self.hud.alpha = 1
            self.postButton.center = CGPoint.init(x: 34, y: -70)
            self.identifyButton.center = CGPoint.init(x: -50, y: -36)
            self.tradeButton.center = CGPoint.init(x: -62, y: 58)
            
            self.postButton.alpha = 1
            self.identifyButton.alpha = 1
            self.tradeButton.alpha = 1
        }
        
        self.isMoreState = false
    }
    
    @objc private func dismiss() {
        moreButton.setImage(UIImage.init(named: "community.more_icon"), for: .normal)
        UIView.animate(withDuration: 0.1, animations: {
            self.postButton.center = self.moreButton.center
            self.identifyButton.center = self.moreButton.center
            self.tradeButton.center = self.moreButton.center
            
            self.postButton.alpha = 0
            self.identifyButton.alpha = 0
            self.tradeButton.alpha = 0
            
            self.hud.alpha = 0
        }) { (finish) in
            self.isMoreState = true
        }
    }
    
    
    override func layoutSubviews() {
        let cornerRadius = self.height / 2
        
        self.layer.cornerRadius = cornerRadius
        
        self.moreButton.frame = self.bounds
        self.moreButton.layer.cornerRadius = cornerRadius

        self.postButton.size = self.size
        self.identifyButton.size = self.size
        self.tradeButton.size = self.size
        
        self.postButton.layer.cornerRadius = cornerRadius
        self.identifyButton.layer.cornerRadius = cornerRadius
        self.tradeButton.layer.cornerRadius = cornerRadius
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return true
    }
    
}
