//
//  DynamicConstraintViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/20.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class DynamicConstraintViewController: CQBaseViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topConstraint.constant = 200
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        topConstraint.constant += 20
    }

}
