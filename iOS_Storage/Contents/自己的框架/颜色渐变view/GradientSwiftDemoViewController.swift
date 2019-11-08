//
//  GradientSwiftDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/28.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientSwiftDemoViewController: CQBaseViewController {
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView.init(colors: [UIColor.red, UIColor.green], direction: .leftTopToRightBottom)
        gradientLabel.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kScreenWidth, height: 100))
        }
        return gradientView
    }()
    
    private lazy var gradientLabel: GradientLabel = {
        let gradientLabel = GradientLabel.init(colors: [UIColor.yellow, UIColor.orange], direction: .leftTopToRightBottom)
        gradientLabel.text = "This is a Label"
        gradientLabel.textAlignment = .center
        gradientLabel.textColor = .white
        gradientLabel.font = UIFont.boldSystemFont(ofSize: 30)
        //        gradientLabel.snp.makeConstraints { (make) in
        //            make.size.equalTo(CGSize(width: kScreenWidth, height: 100))
        //        }
        return gradientLabel
    }()
    
    private lazy var gradientControl: GradientControl = {
        let gradientControl = GradientControl.init(colors: [UIColor.green, UIColor.red], direction: .bottomToTop)
        return gradientControl
    }()
    
    private lazy var gradientButton: GradientButton = {
        let gradientButton = GradientButton.init(colors: [UIColor.orange, UIColor.purple], direction: .leftToRight)
        gradientButton.setTitle("This is a Button", for: .normal)
        gradientButton.setTitleColor(.black, for: .normal)
        gradientButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return gradientButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView  = UIStackView.init(arrangedSubviews: [gradientView, gradientLabel, gradientControl, gradientButton])
        // item间距
        stackView.spacing = 0
        // 垂直方向布局
        stackView.axis = .vertical
        // 等分
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight)
            make.bottom.equalToSuperview().offset(-kTabBarHeight)
        }
        
    }
    
}
