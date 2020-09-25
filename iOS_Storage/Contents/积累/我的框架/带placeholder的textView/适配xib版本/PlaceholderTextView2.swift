//
//  PlaceholderTextView2.swift
//  CQ
//
//  Created by caiqiang on 2020/9/24.
//  Copyright © 2020 dingstock. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable

class PlaceholderTextView2: UITextView {
    
    // MARK: - 配置 placeholder
    
    @IBInspectable var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    @IBInspectable var placeholderTextColor: UIColor = .black {
        didSet {
            placeholderLabel.textColor = placeholderTextColor
        }
    }
    
    @IBInspectable var placeholderFontName: String = "HelveticaNeue" {
        didSet {
            placeholderLabel.font = UIFont.init(name: placeholderFontName, size: placeholderFontSize)
        }
    }

    @IBInspectable var placeholderFontSize: CGFloat = 12 {
        didSet {
            placeholderLabel.font = UIFont.init(name: placeholderFontName, size: placeholderFontSize)
        }
    }
    
    @IBInspectable var leftMarge: CGFloat = 0 {
        didSet {
            refreshLayout()
        }
    }
    
    @IBInspectable var topMarge: CGFloat = 0 {
        didSet {
            refreshLayout()
        }
    }
    
    @IBInspectable var rightMarge: CGFloat = 0 {
        didSet {
            refreshLayout()
        }
    }
    
    @IBInspectable var bottomMarge: CGFloat = 0 {
        didSet {
            refreshLayout()
        }
    }
    
    // MARK: -
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChanged), name: UITextView.textDidChangeNotification, object: nil)
        addSubview(placeholderLabel)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override var text: String! {
        didSet {
            handleTextChanged()
        }
    }
    
    @objc private func handleTextChanged() {
        placeholderLabel.isHidden = text.count != 0
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        refreshLayout()
    }
    
    private func refreshLayout() {
        placeholderLabel.frame = .init(x: leftMarge, y: topMarge, width: self.frame.width-leftMarge-rightMarge, height: 0)
        placeholderLabel.sizeToFit()
        
        // 调整 placeholder 的高度
        let maxHeight = self.frame.height - topMarge - bottomMarge
        var placeholderHeight = placeholderLabel.frame.height
        if placeholderHeight > maxHeight {
            placeholderHeight = maxHeight
        }
        
        placeholderLabel.frame = .init(x: leftMarge, y: topMarge, width: self.frame.width-leftMarge-rightMarge, height: placeholderHeight)
        placeholderLabel.sizeToFit()
    }
    
}
