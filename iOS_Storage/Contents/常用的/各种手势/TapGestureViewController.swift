//
//  TapGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TapGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "单击手势"
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(viewTaped(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func viewTaped(gesture: UITapGestureRecognizer) {
        gesture.view?.backgroundColor = .red
    }

}
