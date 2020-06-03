//
//  IQKeyboardManagerViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/23.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class IQKeyboardManagerViewController: CQBaseViewController {
    
    private let blueTextField = UITextField()
    private let redTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "未开启IQKeyboardManager"
        
        view.addSubview(blueTextField)
        blueTextField.placeholder = "请输入"
        blueTextField.backgroundColor = .blue
        blueTextField.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.right.equalTo(-90)
            make.bottom.equalTo(-300)
            make.height.equalTo(40)
        }
        
        view.addSubview(redTextField)
        redTextField.placeholder = "请输入"
        redTextField.backgroundColor = .red
        redTextField.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.right.equalTo(-90)
            make.bottom.equalTo(-100)
            make.height.equalTo(40)
        }
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "点击跳转"
        label.font = .boldSystemFont(ofSize: 20)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = IQKeyboardManagerViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }

}
