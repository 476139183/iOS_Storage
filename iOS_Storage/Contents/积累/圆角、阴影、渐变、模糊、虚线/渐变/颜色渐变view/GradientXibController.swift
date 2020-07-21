//
//  GradientXibController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GradientXibController: CQBaseViewController {
    
    
    @IBOutlet weak var gradientView: GradientView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        gradientView.config(colors: [.yellow, .blue], direction: .topToBottom)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gradientView.config(colors: [.orange, .red], direction: .topToBottom)
    }
    

}
