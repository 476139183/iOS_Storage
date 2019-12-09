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
        
        let label1 = UILabel()
        view.addSubview(label1)
        label1.font = .boldSystemFont(ofSize: 15)
        label1.text = "昵称bold"
        label1.frame = .init(x: 90, y: 200, width: 200, height: 30)
        
        let label2 = UILabel()
        view.addSubview(label2)
        label2.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label2.text = "昵称medium"
        label2.frame = .init(x: 90, y: 230, width: 200, height: 30)
        
        let label3 = UILabel()
        view.addSubview(label3)
        label3.font = .systemFont(ofSize: 15)
        label3.text = "昵称regular"
        label3.frame = .init(x: 90, y: 260, width: 200, height: 30)
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
