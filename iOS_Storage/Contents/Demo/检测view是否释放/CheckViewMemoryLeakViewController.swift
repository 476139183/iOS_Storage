//
//  CheckViewMemoryLeakViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CheckViewMemoryLeakViewController: CQBaseViewController {
    
    private lazy var redView: RedView = {
        let myRedView = RedView()
        myRedView.viewTapedClosure = { [weak self] in
            self?.redView.removeFromSuperview()
        }
        return myRedView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.frame = CGRect(x: 0, y: 90, width: 90, height: 90)
    }

}


fileprivate class RedView: UIView {
    
    var viewTapedClosure: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTaped))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("red view 释放")
    }
    
    @objc private func viewTaped() {
        viewTapedClosure?()
    }
    
}
