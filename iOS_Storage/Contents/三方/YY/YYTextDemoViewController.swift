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
        
        
        
        let grayView = UIView()
        view.addSubview(grayView)
        grayView.backgroundColor = UIColor.colorWithHexString("#F4F4F8")
        grayView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
        let text = "在确认购买或免费试用到期了，将从您的iTunes账户中收取费用。如需取消续订，请在当前订阅到期前24小时以前，手动在iTunes/Apple ID设置管理中关闭自动续费功能，点击购买即表示您同意我们的《自动续费服务规则》和《会员服务协议》"
        
        let descLabel = YYLabel()
        grayView.addSubview(descLabel)
        descLabel.font = .systemFont(ofSize: 11)
        descLabel.textColor = UIColor.colorWithHexString("#81879B")
        descLabel.numberOfLines = 10
        descLabel.text = text
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
            make.height.equalTo(100)
        }
        
    }

}
