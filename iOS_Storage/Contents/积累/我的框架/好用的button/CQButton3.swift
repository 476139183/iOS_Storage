//
//  CQButton3.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

@IBDesignable

class CQButton3: UIButton {
    
    @IBInspectable var fontName: String = "PingFangSC" {
        didSet {
            self.titleLabel?.font = UIFont.init(name: fontName, size: fontSize)
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            self.titleLabel?.font = UIFont.init(name: fontName, size: fontSize)
        }
    }

}



class MyView3: UIView {
    @IBInspectable var labelFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            print("dhdh")
        }
    }
}


class MyCustomView: UIView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    @IBInspectable var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
@IBInspectable var fontName: String = "HelveticaNeue-Medium" {
    didSet {
        label.font = UIFont.init(name: fontName, size: fontSize)
    }
}

@IBInspectable var fontSize: CGFloat = 12 {
    didSet {
        label.font = UIFont.init(name: fontName, size: fontSize)
    }
}

}


// AmericanTypewriter-Bold
