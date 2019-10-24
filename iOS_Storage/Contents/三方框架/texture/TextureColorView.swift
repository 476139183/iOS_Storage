//
//  TextureColorView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/26.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureColorView: UIView {
    
    // MARK: - Lazy
    
    /// 红色view
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    /// 蓝色view
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    func setupUI() {
        backgroundColor = .green
        
        addSubview(redView)
        addSubview(blueView)
        
        redView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalTo(self.snp.centerX).offset(-10)
        }
        
        blueView.snp.makeConstraints { (make) in
            make.top.equalTo(redView)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(redView)
            make.left.equalTo(self.snp.centerX).offset(10)
        }
    }

}
