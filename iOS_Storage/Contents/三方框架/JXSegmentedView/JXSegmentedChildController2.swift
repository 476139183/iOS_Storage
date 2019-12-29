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
        label.text = "12345\nddddd"
        label.font = .boldSystemFont(ofSize: 100)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
        let view2 = UIView.init(frame: CGRect.init(x: 90, y: 90, width: 90, height: 90))
        view2.gradientBackground(startColor: UIColor.white.withAlphaComponent(0), endColor: .white, frame: label.bounds, startPoint: CGPoint.init(x: 0, y: 0), endPoint: CGPoint.init(x: 1, y: 0))
        view.addSubview(view2)
        
        
        let label2 = UILabel.init(frame: CGRect.init(x: 90, y: 290, width: 90, height: 45))
        label2.text = "2333333"
        label2.font = .boldSystemFont(ofSize: 12)
        label2.numberOfLines = 0
        label2.textAlignment = .right
        label2.adjustsFontSizeToFitWidth = true
        view.addSubview(label2)
        
        let imageView = UIImageView(image: UIImage(named: "line"))
        label2.addSubview(imageView)
        imageView.gradientBackground(startColor: UIColor.white.withAlphaComponent(0), endColor: .white, frame: CGRect(x: 0, y: 0, width: 8, height: 45), startPoint: CGPoint.init(x: 0, y: 0), endPoint: CGPoint.init(x: 1, y: 0))
        imageView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(8)
        }
    }

}


