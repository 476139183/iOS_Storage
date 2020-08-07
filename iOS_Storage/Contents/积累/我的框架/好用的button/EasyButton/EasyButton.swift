//
//  EasyButton.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class EasyButton: UIControl {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        self.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        return label
    }()
    
    init(image: UIImage, title: String, font: UIFont, titleColor: UIColor) {
        self.init()
        
        self.imageView.image = image
        self.titleLabel.text = title
        self.titleLabel.font = font
        self.titleLabel.textColor = titleColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
