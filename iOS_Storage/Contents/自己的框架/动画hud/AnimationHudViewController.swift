//
//  AnimationHudViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimationHudViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.setTitle("show", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    

    @objc private func buttonClicked() {
        let myView = CustomView()
        myView.size = .init(width: 200, height: 200)
        AnimationHud.show(with: myView)
    }

}

fileprivate class CustomView: UIView {
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .red
        
        addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
}
