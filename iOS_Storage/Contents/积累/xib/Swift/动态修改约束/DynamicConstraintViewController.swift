//
//  DynamicConstraintViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/20.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class DynamicConstraintViewController1: CQBaseViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = DynamicConstraintViewController()
        present(vc, animated: false, completion: nil)
    }
    
}

class DynamicConstraintViewController: CQBaseViewController {
    
    @IBOutlet weak var redViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        redViewHeight.constant = 0
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        UIView.animate(withDuration: 0.2) {
            self.redViewHeight.constant = 300
            self.view.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
