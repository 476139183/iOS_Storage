//
//  RegularExpressionViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

// https://www.runoob.com/regexp/regexp-intro.html
//

import UIKit
import TTTAttributedLabel

class RegularExpressionViewController: CQBaseViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.text = "当前链接：[百度](https://www.baidu.com)"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var ttLabel: TTTAttributedLabel = {
        let label = TTTAttributedLabel.init(frame: .zero)
        label.delegate = self
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.text = "当前链接：[百度](https://www.baidu.com)"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("check", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        view.addSubview(ttLabel)
        view.addSubview(checkButton)
        
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(120)
            make.width.equalTo(300)
        }
        
        ttLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(180)
            make.width.equalTo(300)
        }
        
        checkButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
    }
    
    @objc private func checkButtonClicked() {
        checkMarkDownURL(label: self.label)
        checkTTLabel()
    }
    
    private func test1() {
        let account = "j20-233"
        
        let range = NSRange.init(location: 0, length: 3)
        
        let sentence = "I'd like to follow my fellow to the fallow to see a hallow harrow."
        
        do {
            // [a-z] 表明该字母可以是a-z中的任意一个
            let regex = try NSRegularExpression(pattern: "f[a-z]llow", options: [])
            
            // matches 的类型是 NSTextCheckingResult 的数组
            let matches = regex.matches(in: sentence, options: [], range: NSRange(location: 0, length: sentence.count))
            print("\(matches.count) matches.")
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - 匹配 MarkDown 链接
    private func checkMarkDownURL(label: UILabel) {
        // 源
        guard let string = label.text else {
            return
        }
        // 正则规则字符串
        let pattern = "(\\[.+\\]\\([^\\)]+\\))|(<.+>)"
        // 正则规则
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        /// 进行正则匹配
        if let results = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)), results.count != 0 {
            print(results)
            print("匹配成功")
            for result in results {
                let url = (string as NSString).substring(with: result.range)
                print("对应链接:",url)
                // 替换文本
                
                //guard let range = Range.init(result.range) else { return }
                
                let linkName = url.components(separatedBy: ["[", "]"])[1]
                let linkURL = url.components(separatedBy: ["(", ")"])[1]
                let newString = string.replacingOccurrences(of: url, with: linkName)
                
                // 找到对应链接
                let range = (newString as NSString).range(of: linkName)
                
                let attributedString = NSMutableAttributedString.init(string: newString)
                attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
                attributedString.addAttribute(NSAttributedString.Key.link, value: linkURL, range: range)
                
                self.label.attributedText = attributedString
                
                //let urlName = url.components(separatedBy: Set.init(arrayLiteral: ""))
            }
        }
    }
    
    private func checkTTLabel() {
        // 源
        let string = "当前链接：[百度](https://www.baidu.com)"
        // 正则规则字符串
        let pattern = "(\\[.+\\]\\([^\\)]+\\))|(<.+>)"
        // 正则规则
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        /// 进行正则匹配
        if let results = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)), results.count != 0 {
            print(results)
            print("匹配成功")
            for result in results {
                let url = (string as NSString).substring(with: result.range)
                print("对应链接:",url)
                // 替换文本
                
                //guard let range = Range.init(result.range) else { return }
                
                let linkName = url.components(separatedBy: ["[", "]"])[1]
                let linkURL = url.components(separatedBy: ["(", ")"])[1]
                let newString = string.replacingOccurrences(of: url, with: linkName)
                
                // 找到对应链接
                let range = (newString as NSString).range(of: linkName)
                
//                let attributedString = NSMutableAttributedString.init(string: newString)
//                attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
//                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
//                attributedString.addAttribute(NSAttributedString.Key.link, value: linkURL, range: range)
                
                //self.ttLabel.attributedText = attributedString
                self.ttLabel.addLink(with: NSTextCheckingResult.linkCheckingResult(range: range, url: URL.init(string: linkURL)!), attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.red,
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
                ])
                
                self.ttLabel.setText(newString)
                
                //let urlName = url.components(separatedBy: Set.init(arrayLiteral: ""))
            }
        }
    }
    
    private func test3() {
        let url = "123dnf123"
        let pattern = "dnf"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        if let results = regex?.matches(in: url, options: [], range: NSRange.init(location: 0, length: url.count)), results.count != 0 {
            print("is dnf")
        } else {
            print("not dnf")
        }
    }
    
}


extension RegularExpressionViewController: TTTAttributedLabelDelegate {
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        print(url)
    }
    
}

