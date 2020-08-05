//
//  SwiftPrefixViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftPrefixViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // 类似 RxSwift 的 Rx，Kingfish 的 kf，SnapKit 的 snp
        
        let redView = UIView()
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        redView.ds.setBorder(color: .green, width: 3)
        
    }

}


fileprivate class CQCPerson {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    convenience init() {
        self.init(name: "unknow", age: 1)
    }
    
    func say() {
        print("Hi, my name is \(name)")
    }
}

extension UIView: DingStockWrappable {}
extension DingStockWrapperProtocol where WrappedType: UIView {
    
    func setBorder(color: UIColor, width: CGFloat) {
        wrappedValue.layer.borderColor = color.cgColor
        wrappedValue.layer.borderWidth = width
    }
    
}
