//
//  TTTLabelViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

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
            NSAttributedString.Key.foregroundColor: UIColor.blue])
        
    }
    
    

}


extension TTTLabelViewController: TTTAttributedLabelDelegate {
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url.absoluteString)
    }
    
}
