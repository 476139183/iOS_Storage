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

class RegularExpressionViewController: CQBaseViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .orange
        return textField
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("check", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var origionalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var checkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var textView: YYTextView = {
        let textView = YYTextView()
        textView.backgroundColor = .purple
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(textField)
        view.addSubview(checkButton)
        view.addSubview(origionalLabel)
        view.addSubview(checkLabel)
        
        textField.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.left.right.height.equalTo(textField)
        }
        
        origionalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(checkButton.snp.bottom).offset(30)
            make.left.right.height.equalTo(textField)
        }
        
        checkLabel.snp.makeConstraints { (make) in
            make.top.equalTo(origionalLabel.snp.bottom).offset(30)
            make.left.right.height.equalTo(textField)
        }
        
    }
    
    @objc private func checkButtonClicked() {
        
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
    
    
    private func test2() {
        /// 帐号
        let acount = "当前链接：[百度](https://www.baidu.com)"
        /// 正则规则字符串
        //let pattern = "^[A-Z,a-z,\\d]+([-_.][A-Z,a-z,\\d]+)*@([A-Z,a-z,\\d]+[-.])+[A-Z,a-z,\\d]{2,4}"
        let pattern = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
        /// 正则规则
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        /// 进行正则匹配
        if let results = regex?.matches(in: acount, options: [], range: NSRange(location: 0, length: acount.count)), results.count != 0 {
            print("帐号匹配成功")
            for result in results{
                let string = (acount as NSString).substring(with: result.range)
                print("对应帐号:",string)
            }
        }
    }
    
}


// ((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)
