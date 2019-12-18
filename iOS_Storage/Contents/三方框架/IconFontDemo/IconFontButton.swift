//
//  IconFontButton.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class IconFontButton: UIButton {
    
    /// 左边icon，右边title的button（如果要调整布局，可以通过对三个控件进行重新布局）
    /// - Parameter icon: icon
    /// - Parameter iconFontSize: icon 的 font size
    /// - Parameter text: 文本
    /// - Parameter textFont: 文本 font
    /// - Parameter buttonTitleColor: 字体颜色
    /// - Parameter spacing: icon 和 title 的间距
    func set(icon: String, iconFontSize: CGFloat, text: String, textFont: UIFont, buttonTitleColor: UIColor, spacing: CGFloat) {
        iconLabel.textColor = buttonTitleColor
        iconLabel.text = icon
        iconLabel.font = IconFont.font(size: iconFontSize)
        textLabel.textColor = buttonTitleColor
        textLabel.text = text
        textLabel.font = textFont
        
        self.spacing = spacing
    }
    
    /// icon 和 title 间距
    private var spacing: CGFloat = 0 {
        didSet {
            textLabel.snp.updateConstraints { (make) in
                make.left.equalTo(iconLabel.snp.right).offset(spacing)
            }
        }
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var iconLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.addSubview(iconLabel)
        contentView.addSubview(textLabel)
        
        contentView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        iconLabel.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(iconLabel.snp.right).offset(5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
