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
        
        // 带前缀的方法
        redView.ds.setBorder(color: .green, width: 3)
        
        // 打印 实例和对象 的类名
        print(redView.ds.className)
        print(UIView.ds.className)
        
        let dog = Target_dog()
        print(dog.ds.className)
        print(Target_dog.ds.className)
        
    }
    
}


// MARK: - UIView 的扩展

extension UIView: DingStockWrappable {}
extension DingStockWrapperProtocol where WrappedType: UIView {
    
    func setBorder(color: UIColor, width: CGFloat) {
        wrappedValue.layer.borderColor = color.cgColor
        wrappedValue.layer.borderWidth = width
    }
    
}
