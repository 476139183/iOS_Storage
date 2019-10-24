//
//  JXSegmentedChildController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class JXSegmentedChildController2: JXSegmentedDemoBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let label = UILabel.init(frame: CGRect.init(x: 90, y: 90, width: 90, height: 90))
        label.text = "12345"
        label.font = .boldSystemFont(ofSize: 100)
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        let view2 = UIView.init(frame: CGRect.init(x: 90, y: 90, width: 90, height: 90))
        view2.gradientBackground(startColor: UIColor.white.withAlphaComponent(0), endColor: .white, frame: label.bounds, startPoint: CGPoint.init(x: 0, y: 0), endPoint: CGPoint.init(x: 1, y: 0))
        view.addSubview(view2)
    }

}


