//
//  XibTTTLabelViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/7.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class XibTTTLabelViewController: CQBaseViewController {

    @IBOutlet weak var label: TTTAttributedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.delegate = self
        
        let text: NSString = label.text as! NSString
        
        let rule: String = "《用户服务协议》"
        let strategy: String = "《隐私政策》"
        
        let ruleRange: NSRange = text.range(of: rule)
        let strategRange: NSRange = text.range(of: strategy)
        
        let attString = NSMutableAttributedString.init(string: text as String)
        
        
        // 用 text 而不是 attributedText
        label.text = attString
        
        // 添加属性
        label.linkAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.blue.cgColor,
            NSAttributedString.Key.underlineColor.rawValue: UIColor.blue.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: NSNumber(value: NSUnderlineStyle.single.rawValue),
        ]
        
        // 点击时的状态
        label.activeLinkAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.green.cgColor,
            NSAttributedString.Key.underlineColor.rawValue: UIColor.green.cgColor,
            NSAttributedString.Key.underlineStyle.rawValue: NSNumber(value: NSUnderlineStyle.single.rawValue)
        ]
        let baidu  = URL(string: "https://www.baidu.com")!
        let google = URL(string: "https://www.google.com")!
        
        label.addLink(to: baidu, with: ruleRange)
        label.addLink(to: google, with: strategRange)
        
    }

}


extension XibTTTLabelViewController: TTTAttributedLabelDelegate {
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url.absoluteString)
    }
    
}
