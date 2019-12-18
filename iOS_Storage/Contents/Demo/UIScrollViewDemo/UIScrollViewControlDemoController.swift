//
//  UIScrollViewControlDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UIScrollViewControlDemoController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        scrollView.contentSize = view.bounds.size
        
        let control = UIControl()
        scrollView.addSubview(control)
        control.frame = CGRect(x: 90, y: 90, width: 90, height: 90)
        control.backgroundColor = .red
        control.addTarget(self, action: #selector(controlClicked), for: .touchUpInside)
        
        let button = UIButton()
        scrollView.addSubview(button)
        button.frame = CGRect(x: 90, y: 200, width: 90, height: 90)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
    }
    
    @objc private func controlClicked() {
        print("control clicked")
    }
    
    @objc private func buttonClicked() {
        print("button clicked")
    }

}
