//
//  StackViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StackViewDemoViewController: CQBaseViewController {
    
    private var stackView: UIStackView! = UIStackView()
    
    private lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        return redView
    }()
    
    private lazy var greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 30))
        }
        return greenView
    }()
    
    private lazy var blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        return blueView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        stackView = UIStackView.init(arrangedSubviews: [redView, greenView, blueView])
        view.addSubview(stackView)
        stackView.backgroundColor = .orange
        // item间距
        stackView.spacing = 30
        // 水平方向布局
        stackView.axis = .horizontal
        // 底部对齐
        stackView.alignment = .bottom
        // 等间距
        stackView.distribution = .equalSpacing
        
        // 不设置宽度，让它宽度自适应
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // remove或者隐藏，stackView都会重新布局
        stackView.removeArrangedSubview(greenView)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.stackView.insertArrangedSubview(self.greenView, at: 1)
        }
        
        //greenView.removeFromSuperview()
        //greenView.isHidden = true
        
    }


}


