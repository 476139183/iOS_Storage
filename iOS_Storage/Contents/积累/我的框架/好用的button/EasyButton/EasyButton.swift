//
//  EasyButton.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class EasyButton: UIButton {
    
    // MARK: - Xib 使用
    
    /// 是否只显示 label
    @IBInspectable var isOnlyLabel: Bool = false {
        didSet {
            dsImageView.isHidden = isOnlyLabel
            dsTitleLabel.snp.remakeConstraints { (make) in
                make.center.equalToSuperview()
            }
        }
    }
    
    
    @IBInspectable var fontName: String = "HelveticaNeue-Medium" {
        didSet {
            if !self.isSelected {
                dsTitleLabel.font = UIFont.init(name: fontName, size: fontSize)
            }
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            if !self.isSelected {
                dsTitleLabel.font = UIFont.init(name: fontName, size: fontSize)
            }
        }
    }
    
    @IBInspectable var selectedFontName: String = "HelveticaNeue-Medium" {
        didSet {
            if self.isSelected {
                dsTitleLabel.font = UIFont.init(name: selectedFontName, size: selectedFontSize)
            }
        }
    }
    
    @IBInspectable var selectedFontSize: CGFloat = 12 {
        didSet {
            if self.isSelected {
                dsTitleLabel.font = UIFont.init(name: selectedFontName, size: selectedFontSize)
            }
        }
    }
    
    @IBInspectable var title: String = "" {
        didSet {
            dsTitleLabel.text = title
        }
    }
    
    @IBInspectable var textColor: UIColor = .black {
        didSet {
            if !self.isSelected {
                dsTitleLabel.textColor = textColor
            }
        }
    }
    
    @IBInspectable var selectedTextColor: UIColor = .black {
        didSet {
            if self.isSelected {
                dsTitleLabel.textColor = textColor
            }
        }
    }
    
    @IBInspectable var image: UIImage = UIImage.init(named: "jia")! {
        didSet {
            if !isSelected {
                dsImageView.image = image
            }
        }
    }
    
    @IBInspectable var selectedImage: UIImage = UIImage.init(named: "jia")! {
        didSet {
            if isSelected {
                dsImageView.image = image
            }
        }
    }
    
    @IBInspectable var imageSize: CGSize = .zero {
        didSet {
            reLayout()
        }
    }
    
    @IBInspectable var spacing: CGFloat = 0 {
        didSet {
            reLayout()
        }
    }
    
    /// 重新布局
    private func reLayout() {
        dsTitleLabel.snp.remakeConstraints { (make) in
            make.left.centerY.equalToSuperview()
        }
        dsImageView.snp.remakeConstraints { (make) in
            make.size.equalTo(imageSize)
            make.centerY.right.equalToSuperview()
            make.left.equalTo(dsTitleLabel.snp.right).offset(spacing)
        }
    }
    
    /// 是否选中
    @IBInspectable var isSelectedState: Bool = false {
        didSet {
            isSelected = isSelectedState
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                dsTitleLabel.textColor = selectedTextColor
                dsImageView.image = selectedImage
                dsTitleLabel.font = UIFont.init(name: selectedFontName, size: selectedFontSize)
            } else {
                dsTitleLabel.textColor = textColor
                dsImageView.image = image
                dsTitleLabel.font = UIFont.init(name: fontName, size: fontSize)
            }
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            self.contentView.backgroundColor = self.backgroundColor
        }
    }
    
    
    // MARK: - 控件

    lazy var dsImageView: UIImageView = {
        let imageView = UIImageView()
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    lazy var dsTitleLabel: UILabel = {
        let label = UILabel()
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        addSubview(view)
        view.backgroundColor = self.backgroundColor
        view.isUserInteractionEnabled = false
        view.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        return view
    }()
    
    
    // MARK: - 便利方法
    
    init(image: UIImage, title: String, font: UIFont, titleColor: UIColor) {
        self.init()
        
        self.dsImageView.image = image
        self.dsTitleLabel.text = title
        self.dsTitleLabel.font = font
        self.dsTitleLabel.textColor = titleColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.setTitleColor(.clear, for: .normal)
        self.setTitleColor(.clear, for: .selected)
        self.imageView?.isHidden = true
        self.titleLabel?.isHidden = true
    }
    
}
