//
//  TTTBasicViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class TTTBasicViewController: CQBaseViewController {
    
    let tttLabel = TTTAttributedLabel.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let grayView = UIView()
        view.addSubview(grayView)
        grayView.backgroundColor = UIColor.colorWithHexString("#F4F4F8")
        grayView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
        grayView.addSubview(tttLabel)
        tttLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tttLabel.delegate = self
        tttLabel.numberOfLines = 0
        tttLabel.backgroundColor = .lightText
        tttLabel.textColor = UIColor.colorWithHexString("#81879B")
        tttLabel.text = "在确认购买或免费试用到期了，将从您的iTunes账户中收取费用。如需取消续订，请在当前订阅到期前24小时以前，手动在iTunes/Apple ID设置管理中关闭自动续费功能，点击购买即表示您同意我们的《自动续费服务规则》和《会员服务协议》"
        tttLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 20, left: 30, bottom: 50, right: 30))
        }
        
        let text: NSString = tttLabel.text as! NSString
        let rule: NSString = "《自动续费服务规则》"
        let proto: NSString = "《会员服务协议》"
        let ruleRange = text.range(of: rule as String)
        let protoRange = text.range(of: proto as String)
        
        let attString = NSMutableAttributedString.init(string: tttLabel.text as! String)
        
        
        // 用 text 而不是 attributedText
        tttLabel.text = attString
        
        // 添加属性
        tttLabel.linkAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.blue.cgColor,
            NSAttributedString.Key.underlineColor.rawValue: UIColor.blue.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: NSNumber(value: NSUnderlineStyle.single.rawValue),
        ]
        //activeLinkAttributes
        tttLabel.activeLinkAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.green.cgColor,
            NSAttributedString.Key.underlineColor.rawValue: UIColor.green.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: NSNumber(value: NSUnderlineStyle.single.rawValue)
        ]
        
        let baidu  = URL(string: "https://www.baidu.com")!
        let google = URL(string: "https://www.google.com")!
        
        tttLabel.addLink(to: baidu, with: ruleRange)
        tttLabel.addLink(to: google, with: protoRange)
        
    }
    
}


extension TTTBasicViewController: TTTAttributedLabelDelegate {
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url.absoluteString)
    }
    
}
