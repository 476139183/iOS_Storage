//
//  LoadingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/1.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import SnapKit

class YeezyLoadingViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton.init(type: .system)
        view.addSubview(button)
        button.setTitle("点击 show loading，2秒消失", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    @objc private func buttonClicked() {
        print("click")
        
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismissLoading()
        }
    }
    
    @objc private func showLoading() {
        Loading.show(on: self.view)
        
//        let load = Loading.show(on: self.view, frame: CGRect(x: 90, y: 90, width: 200, height: 200))
//        load.backgroundColor = .green
        
        //Loading.show(on: self.view, frame: CGRect(x: 90, y: 90, width: 200, height: 200), backgroundColor: .gray)
    }
    
    @objc private func dismissLoading() {
        Loading.remove(from: self.view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
    }

}
