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
        return gradientView
    }()
    
    private lazy var gradientLabel: GradientLabel = {
        let gradientLabel = GradientLabel.init(colors: [UIColor.yellow, UIColor.orange], direction: .leftTopToRightBottom)
        gradientLabel.text = "This is a Label"
        gradientLabel.textAlignment = .center
        gradientLabel.textColor = .white
        gradientLabel.font = UIFont.boldSystemFont(ofSize: 30)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(gradientView)
        view.addSubview(gradientLabel)
        view.addSubview(gradientControl)
        view.addSubview(gradientButton)
        
        
        let viewArray = [gradientView, gradientLabel, gradientControl, gradientButton]
        
        viewArray.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 10, leadSpacing: 100, tailSpacing: 100)
        viewArray.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
        }
        
    }
    
}
