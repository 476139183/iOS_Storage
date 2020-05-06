//
//  StandardSwiftSectionFooterView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftSectionFooterView: UITableViewHeaderFooterView {
    
    private let moreButton = UIButton()
    var moreButtonClickedClosure: (() -> Void)?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func setupUI() {
        contentView.backgroundColor = .purple
        
        contentView.addSubview(moreButton)
        moreButton.setTitle("more", for: .normal)
        moreButton.backgroundColor = .blue
        moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchDown)
        moreButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 30))
        }
    }
    
    // MARK: - action
    @objc func moreButtonClicked() {
        if let closure = self.moreButtonClickedClosure {
            closure()
        }
    }
}
