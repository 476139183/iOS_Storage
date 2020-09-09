//
//  GradientXibController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GradientXibController: CQBaseViewController {
    
    
    @IBOutlet weak var leftToRightLabel: GradientLabel!
    @IBOutlet weak var gradientView: GradientView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        leftToRightLabel.configWith(colors: [UIColor.white.withAlphaComponent(1), .red, UIColor.white.withAlphaComponent(1)], direction: .leftToRight)
        
        gradientView.config(colors: [.white, .red, .white], direction: .topToBottom)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gradientView.config(colors: [.orange, .red], direction: .topToBottom)
    }
    

}
