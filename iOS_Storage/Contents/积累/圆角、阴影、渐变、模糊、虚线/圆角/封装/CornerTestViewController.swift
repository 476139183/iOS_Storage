//
//  CornerTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CornerTestViewController: CQBaseViewController {
    
    //    private lazy var blueView: BlueCornerRadiusView = {
    //        let view = Bundle.main.loadNibNamed("BlueCornerRadiusView", owner: nil, options: nil)?.first as! BlueCornerRadiusView
    //        view.setCornerRadius(radius: 10, corners: [.topRight, .topLeft])
    //        return view
    //    }()
    
    private lazy var redView: CornerRadiusView = {
        let view = CornerRadiusView()
        view.setCornerRadius(radius: 20, corners: [.bottomLeft, .bottomRight])
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var greenView: CornerRadiusView = {
        let view = CornerRadiusView()
        view.setCornerRadius(radius: 10, corners: [.topLeft, .topRight])
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let blueView = UIView(frame: .init(x: 20, y: 100, width: 100, height: 40))
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        let blueViewPath = UIBezierPath.init(roundedRect: blueView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: .init(width: 20, height: 20))
        let blueViewLayer = CAShapeLayer()
        blueViewLayer.frame = blueView.bounds
        blueViewLayer.path = blueViewPath.cgPath
        blueView.layer.mask = blueViewLayer
        
        let orangeView = UIView(frame: .init(x: 150, y: 100, width: 260, height: 40))
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        let orangeViewPath = UIBezierPath.init(roundedRect: .init(x: 0, y: -40, width: 260, height: 80), byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: .init(width: 40, height: 40))
        let orangeViewLayer = CAShapeLayer()
        orangeViewLayer.frame = orangeView.bounds
        orangeViewLayer.path = orangeViewPath.cgPath
        orangeView.layer.mask = orangeViewLayer
        
        // Do any additional setup after loading the view.
        
        //        view.addSubview(blueView)
        //        blueView.snp.makeConstraints { (make) in
        //            make.top.equalTo(100)
        //            make.centerX.equalToSuperview()
        //            make.width.height.equalTo(50)
        //        }
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        view.addSubview(greenView)
        greenView.snp.makeConstraints { (make) in
            make.top.equalTo(redView.snp.bottom).offset(10)
            make.width.equalTo(redView)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
}
