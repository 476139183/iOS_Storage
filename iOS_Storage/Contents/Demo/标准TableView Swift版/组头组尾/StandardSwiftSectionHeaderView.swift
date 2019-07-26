//
//  StandardSwiftSectionHeaderView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftSectionHeaderView: UITableViewHeaderFooterView {
    
    private let detailButton = UIButton()
    var detailButtonClickedClosure:(()->Void)?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func setupUI() {
        contentView.backgroundColor = .orange
        contentView.addSubview(detailButton)
        
        detailButton.setTitle("detail", for: .normal)
        detailButton.backgroundColor = .blue
        detailButton.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        detailButton.snp.makeConstraints { (make) in
            make.top.bottom.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - action
    @objc func buttonClicked() {
        if let closure = self.detailButtonClickedClosure {
            closure()
        }
    }

}
