//
//  StandardSwiftTableFooterView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import SnapKit

class StandardSwiftTableFooterView: UIView {
    
    let button = UIButton()
    var buttonClickedClosure: (()->Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    func setupUI() {
        backgroundColor = .green
        
        self.addSubview(button)
        button.setTitle("可点击", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 40))
        }
    }
    
    @objc func buttonClicked() {
        if let closure = self.buttonClickedClosure {
            closure()
        }
    }

}
