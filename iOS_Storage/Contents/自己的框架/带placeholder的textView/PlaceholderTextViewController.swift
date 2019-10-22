//
//  PlaceholderTextViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PlaceholderTextViewController: CQBaseViewController, UITextViewDelegate {
    
    private let textView = PlaceholderTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(textView)
        
        // 设置内容
        textView.font = .systemFont(ofSize: 15)
        textView.textColor = .black
        textView.backgroundColor = .orange
        textView.delegate = self
        
        textView.placeholderLabel.text = "描述鉴别商品的信息，如颜色、购买渠道、价格等...."
        textView.placeholderLabel.font = .systemFont(ofSize: 15)
        textView.placeholderLabel.textColor = .gray
        
        // 设置边距
        textView.placeholderLabelEdgeInsets = UIEdgeInsets.init(top: 7, left: 5, bottom: 0, right: 5)
        
        textView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "ddddddddddddddddddddd"
        titleLabel.backgroundColor = .red
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(textView)
            make.bottom.equalTo(textView.snp.top).offset(-10)
        }
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(textView.text)
        textView.placeholderLabelEdgeInsets = UIEdgeInsets.init(top: 27, left: 25, bottom: 0, right: 5)
    }
    
}
