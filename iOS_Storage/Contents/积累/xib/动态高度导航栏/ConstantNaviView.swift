//
//  ConstantNaviView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class ConstantNaviView: UIView {
    
    /// 是否是默认高度
    @IBInspectable var isDefaultHeight: Bool = false
    
    @IBInspectable var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    @IBInspectable var isHideBackButton: Bool = false {
        didSet {
            self.backButton.isHidden = isHideBackButton
        }
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "nav_back_icon"), for: .normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(backButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-10)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.left.equalTo(20)
            make.width.height.equalTo(30)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isDefaultHeight {
            self.snp.remakeConstraints { (make) in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(naviHeight)
            }
        }
        
    }

}
