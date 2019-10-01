//
//  YYTextViewDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/1.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class YYTextViewDemoController: CQBaseViewController, YYTextViewDelegate {
    
    private let textView = YYTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
        
        textView.backgroundColor = .orange
        textView.font = .boldSystemFont(ofSize: 20)
        textView.textColor = .black
        
        textView.delegate = self
        
        textView.placeholderText = "这是placeholder"
        textView.placeholderFont = .systemFont(ofSize: 15)
        textView.placeholderTextColor = .darkGray
    }
    
    // MARK: - YYTextView Delegate
    
    func textViewDidChange(_ textView: YYTextView) {
        print(textView.text)
    }

}
