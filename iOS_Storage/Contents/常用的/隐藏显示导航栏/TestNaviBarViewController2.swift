//
//  TestNaviBarViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/20.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TestNaviBarViewController2: CQBaseViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    private lazy var naviView: UIView = {
        let naviView = UIView()
        naviView.backgroundColor = .yellow
        naviView.layer.borderColor = UIColor.lightText.cgColor
        naviView.layer.borderWidth = 1
        return naviView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.text = "自定义导航栏"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("back", for: .normal)
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        view.addSubview(naviView)
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        naviView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(kNavigationBarHeight)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(kStatusBarHeight)
            make.left.right.bottom.equalTo(naviView)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom)
            make.size.centerX.equalTo(backButton)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("did appear")
    }
    
    
    // MARK: - action
    
    @objc private func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func goNext() {
        let vc = TestNaviBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - UINavigationController Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let isHideNaviBar = viewController.isMember(of: TestNaviBarViewController2.self)
        self.navigationController?.setNavigationBarHidden(isHideNaviBar, animated: animated)
    }

}
