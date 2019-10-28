//
//  CornerAndShadowViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CornerAndShadowViewController: CQBaseViewController {
    
    private lazy var redView: UIView = {
        let redView = UIView.init(frame: CGRect.init(x: 90, y: 200, width: 200, height: 90))
        redView.backgroundColor = .red
        redView.clipsToBounds = false
        return redView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        
        let cornerPath = UIBezierPath.init(roundedRect: redView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize.init(width: 20, height: 20))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = redView.bounds
        maskLayer.path = cornerPath.cgPath
        
        redView.layer.cornerRadius = 10
        redView.layer.shadowColor = UIColor.blue.cgColor
        redView.layer.shadowRadius = 15
        redView.layer.shadowOpacity = 1
        
        redView.layer.mask = maskLayer
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView.layer.mask = nil
    }

}
