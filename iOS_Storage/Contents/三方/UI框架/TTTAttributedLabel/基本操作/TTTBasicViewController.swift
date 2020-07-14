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
        
        view.addSubview(tttLabel)
        //tttLabel.delegate = self
        tttLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //        tttLabel.textColor = .black
        tttLabel.isUserInteractionEnabled = true
        tttLabel.numberOfLines = 10
        tttLabel.backgroundColor = .orange
        //tttLabel.enabledTextCheckingTypes = NSTextCheckingTypes(NSTextCheckingResult.CheckingType.link.rawValue)
        tttLabel.text = "link1：[google](https://www.google.com),link2：[github](https://github.com),link3：[stackoverflow](https://stackoverflow.com)"
        tttLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(180)
            make.width.equalTo(300)
            //make.height.equalTo(100)
        }
        
    }
    
}
