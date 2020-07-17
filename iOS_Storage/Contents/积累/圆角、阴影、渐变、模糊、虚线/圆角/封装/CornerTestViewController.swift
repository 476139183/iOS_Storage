//
//  CornerTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CornerTestViewController: CQBaseViewController {
    
    private lazy var blueView: BlueCornerRadiusView = {
        let view = BlueCornerRadiusView.loadNib() as! BlueCornerRadiusView
        view.setCornerRadius(radius: 10, corners: [.topRight, .topLeft])
        return view
    }()
    
    private lazy var redView: CornerRadiusView = {
        let view = CornerRadiusView()
        view.setCornerRadius(radius: 10, corners: [.topLeft, .topRight])
        view.backgroundColor = .red
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.shadowRadius = 5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(blueView)
        blueView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
}
