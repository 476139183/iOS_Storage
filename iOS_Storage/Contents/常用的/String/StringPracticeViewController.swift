//
//  StringPracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StringPracticeViewController: CQBaseViewController {
    
    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        configRedLabel()
        
        
    }
    
    
    private func configRedLabel() {
        
        view.addSubview(redLabel)
        redLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(100)
            make.height.equalTo(20)
        }
        
        let attString1: NSMutableAttributedString = NSMutableAttributedString.attributedString(string: "第一段", font: .boldSystemFont(ofSize: 16), color: .black) as! NSMutableAttributedString
        let attString2: NSMutableAttributedString = NSMutableAttributedString.attributedString(string: "第二段", font: .systemFont(ofSize: 15), color: .white) as! NSMutableAttributedString
        
        attString1.append(attString2)
        
        redLabel.attributedText = attString1
        
    }

}
