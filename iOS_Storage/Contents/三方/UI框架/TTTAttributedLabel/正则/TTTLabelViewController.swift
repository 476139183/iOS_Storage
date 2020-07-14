//
//  TTTLabelViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

// https://www.dazhuanlan.com/2019/10/28/5db5cc6718ae1/

import UIKit
import TTTAttributedLabel

class TTTLabelViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let ttLabel1 = TTTAttributedLabel.init(frame: .zero)
        view.addSubview(ttLabel1)
        ttLabel1.text = "百度：好滴好滴好喝的"
        ttLabel1.textColor = .black
        ttLabel1.font = .systemFont(ofSize: 16)
        ttLabel1.backgroundColor = .orange
        ttLabel1.delegate = self
        ttLabel1.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // 添加链接
        ttLabel1.addLink(with: NSTextCheckingResult.linkCheckingResult(range: NSRange.init(location: 0, length: 2), url: URL.init(string: "https://www.baidu.com")!), attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.backgroundColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.blue]) // 这里设置foregroundColor没效果
        
        
        let attString = NSMutableAttributedString.init(string: ttLabel1.text as! String)
        // 要在这里设置foregroundColor
        attString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange.init(location: 0, length: 2))
        ttLabel1.attributedText = attString
        
        
        
        
        let button = UIButton()
        view.addSubview(button)
        button.backgroundColor = .blue
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(gotoNextPage), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.bottom.equalTo(-100)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(150)
        }
        
        let button2 = UIButton()
        view.addSubview(button2)
        button2.backgroundColor = .blue
        button2.setTitle("next2", for: .normal)
        button2.addTarget(self, action: #selector(gotoNextPage2), for: .touchUpInside)
        button2.snp.makeConstraints { (make) in
            make.bottom.equalTo(-100)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(200)
            make.width.equalTo(150)
        }
        
    }
    
    @objc private func gotoNextPage() {
        let vc = TTTLabelViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func gotoNextPage2() {
        let vc = TTTLabelViewController3()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension TTTLabelViewController: TTTAttributedLabelDelegate {
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url.absoluteString)
    }
    
}
