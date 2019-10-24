//
//  JXSegmentedChildController1.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class JXSegmentedChildController1: JXSegmentedDemoBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("vc1 load")
        
        view.backgroundColor = .red
        
        
        let gradientView = GradientView.init(colors: [.clear, .white, .white], direction: .leftToRight)
        view.addSubview(gradientView)
        gradientView.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.left.equalTo(90)
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
//        gradientView.frame = CGRect.init(x: 90, y: 90, width: 90, height: 90)
//        view.layer.addSublayer(gradientView.layer)
        
        let color = UIColor.init(gradientBounds: CGRect.init(x: 0, y: 0, width: 100, height: 100), colors: [.clear, .white], direction: .leftToRight)
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.colors = [color?.cgColor]
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let arr1 = [1, 2, 3]
        let arr2 = [4, 5, 6]
        
        let arr3 = arr1 + arr2

        print(arr3)
        
    }

}
