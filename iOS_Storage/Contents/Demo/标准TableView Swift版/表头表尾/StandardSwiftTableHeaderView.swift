//
//  StandardSwiftTableHeaderView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftTableHeaderView: UIView {
    
    private let button = UIButton()
    /// 按钮点击回调
    var buttonClickedClosure: (()->Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ui
    
    func setupUI() {
        backgroundColor = .red
        
        button.frame = CGRect.init(x: 80, y: 80, width: 200, height: 40)
        button.backgroundColor = .blue
        button.setTitle("可点击", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        self.addSubview(button)
    }
    
    // MARK: - action
    @objc func buttonClicked() {
        if let closere = self.buttonClickedClosure {
            closere()
        }
    }
}
