//
//  PlaceholderTextView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PlaceholderTextView: UITextView {
    
    /// 占位label
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.backgroundColor = .clear
        return label
    }()
    
    /// 占位label的edgeInsets
    var placeholderLabelEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    // MARK: -
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChangedNotif), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: -
    
    @objc private func handleTextChangedNotif() {
        placeholderLabel.isHidden = text.count != 0
    }
    
    
    // MARK: -
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = placeholderLabelEdgeInsets.left
        let y = placeholderLabelEdgeInsets.top
        let width = self.bounds.size.width - x - placeholderLabelEdgeInsets.right
        
        placeholderLabel.frame = CGRect(x: x, y: y, width: width, height: 0)
        placeholderLabel.sizeToFit() // 高度自适应
    }
    
}
