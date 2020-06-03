//
//  SupernatantViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SupernatantViewController: CQBaseViewController {
    
    private lazy var bgView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let showButton = UIButton()
        view.addSubview(showButton)
        showButton.backgroundColor = .blue
        showButton.setTitle("点击", for: .normal)
        showButton.addTarget(self, action: #selector(showRedVC), for: .touchUpInside)
        showButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 100, height: 40))
        }
        
    }
    
    @objc private func showRedVC() {
        
        view.addSubview(bgView)
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let redVC = RedViewController()
        let naviVC = UINavigationController.init(rootViewController: redVC)
        addChild(naviVC)
        bgView.addSubview(naviVC.view)
        naviVC.view.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(naviHeight+50)
        }
        
        let dismissView = UIView()
        bgView.addSubview(dismissView)
        dismissView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let dismissGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissViewTaped(gesture:)))
        dismissView.addGestureRecognizer(dismissGesture)
        dismissView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(naviVC.view.snp.top)
        }
        
    }
    
    
    @objc private func dismissViewTaped(gesture: UITapGestureRecognizer) {
        bgView.removeFromSuperview()
    }
    
    
}


fileprivate class RedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.backgroundColor = .red
        
        let button = UIButton()
        view.addSubview(button)
        button.backgroundColor = .orange
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
    }
    
    @objc private func nextButtonClicked() {
        let vc = GreenViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("redVC 释放")
    }
    
}


fileprivate class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        let button = UIButton()
        view.addSubview(button)
        button.backgroundColor = .orange
        button.setTitle("pop", for: .normal)
        button.addTarget(self, action: #selector(popButtonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
    }
    
    @objc private func popButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
}
