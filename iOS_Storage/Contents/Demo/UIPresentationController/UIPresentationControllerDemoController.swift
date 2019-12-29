//
//  UIPresentationControllerDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/21.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UIPresentationControllerDemoController: CQBaseViewController {
    
    private lazy var redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.setTitle("click", for: .normal)
        button.addTarget(self, action: #selector(redButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        button.addTarget(self, action: #selector(greenButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.addTarget(self, action: #selector(blueButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    @objc private func redButtonClicked() {
        let vc = UIPresentationController.init(presentedViewController: self, presenting: self)
        
    }
    
    @objc private func greenButtonClicked() {
        
    }
    
    @objc private func blueButtonClicked() {
        
    }

}

