//
//  ChannelButton.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ChannelButton: UIButton {
    
    
    // MARK: - Lazy
    
    private lazy var selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "ic_monitor_unselected")
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.colorWithHexString("#373E4D")
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.text = "精选补货"
        return label
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        addSubview(selectedImageView)
        addSubview(nameLabel)
        
        selectedImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 16, height: 16))
            make.left.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(selectedImageView.snp.right).offset(4)
        }
        
    }
    
}
