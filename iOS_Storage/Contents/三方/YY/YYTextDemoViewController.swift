//
//  YYTextDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class YYTextDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let atext = NSMutableAttributedString.init(string: "@杨超越 请你原地燃烧卡路里")
        // 设置富文本属性
        atext.font = .systemFont(ofSize: 20)
        atext.color = .orange
        // 设置可点击富文本
        atext.setTextHighlight(NSRange.init(location: 0, length: 4), color: .red, backgroundColor: .green) { (view, attringStr, range, rect) in
            SVProgressHUD.showSuccess(withStatus: "燃烧")
        }
        
        let label = YYLabel.init(frame: CGRect.init(x: 20, y: 150, width: 300, height: 30))
        label.isUserInteractionEnabled = true
        label.attributedText = atext
        view.addSubview(label)
    }

}
