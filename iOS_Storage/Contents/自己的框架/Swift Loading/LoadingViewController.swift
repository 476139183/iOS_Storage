//
//  LoadingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/1.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LoadingViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let showItem = UIBarButtonItem(title: "show", style: .plain, target: self, action: #selector(showLoading))
        let dismissItem = UIBarButtonItem(title: "dismiss", style: .plain, target: self, action: #selector(dismissLoading))
        
        navigationItem.rightBarButtonItems = [dismissItem, showItem]
        
        
        let button = UIButton.init(frame: CGRect.init(x: 99, y: 99, width: 99, height: 99))
        view.addSubview(button)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
    }
    
    @objc private func buttonClicked() {
        print("click")
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
