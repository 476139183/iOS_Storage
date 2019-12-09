//
//  UITextViewDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/9.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UITextViewDemoController: CQBaseViewController, UITextViewDelegate {
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.backgroundColor = .yellow
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(textView)
        textView.frame = CGRect(x: 90, y: 90, width: 200, height: 300)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // MARK: - 限制输入长度
        if textView.text.count > 5 {
            textView.text = textView.text.subStringTo(index: 5)
        }
        print(textView.text)
    }
    
}
