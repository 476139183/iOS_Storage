//
//  StackViewDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StackViewDemoViewController: CQBaseViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView  = UIStackView.init(arrangedSubviews: [redView, greenView, blueView])
        // item间距
        stackView.spacing = 30
        // 水平方向布局
        stackView.axis = .horizontal
        // 底部对齐
        stackView.alignment = .bottom
        // 等间距
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var stackView2: UIStackView = {
        var imageViewArray: [UIView] = []
        for _ in 0..<5 {
            let imageView = UIImageView.init(image: UIImage.init(named: "interesting"))
            imageView.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize.init(width: 50, height: 50))
            }
            imageViewArray.append(imageView)
            imageView.layer.cornerRadius = 25
            imageView.clipsToBounds = true
        }
        let stackView = UIStackView.init(arrangedSubviews: imageViewArray)
        // item间距
        stackView.spacing = -15
        // 水平方向布局
        stackView.axis = .horizontal
        // center对齐
        stackView.alignment = .center
        
        stackView.distribution = .fillEqually
        
        
        return stackView
    }()
    
    private lazy var stackView3: UIStackView = {
        let button1 = ChannelButton()
        button1.backgroundColor = .orange
        button1.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 72, height: 18))
        }
        
        let button2 = ChannelButton()
        button2.backgroundColor = .yellow
        button2.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 72, height: 18))
        }
        
        let stackView = UIStackView.init(arrangedSubviews: [button1, button2])
        stackView.spacing = 14
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
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
        
        view.addSubview(stackView)
        // 不设置宽度，让它宽度自适应
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(stackView2)
        stackView2.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(stackView3)
        stackView3.snp.makeConstraints { (make) in
            make.top.equalTo(300)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(18)
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // remove或者隐藏，stackView都会重新布局
        greenView.isHidden = true
        
        for button in stackView3.arrangedSubviews {
            button.removeFromSuperview()
        }
    }
    
}





