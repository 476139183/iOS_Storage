//
//  SwiftXibCustomViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibCustomViewController: CQBaseViewController {
    
    let redView: SwiftXibRedView = Bundle.main.loadNibNamed("SwiftXibRedView", owner: self, options: nil)?.first as! SwiftXibRedView

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.redView.leftConstraint.constant = 100
    }
    

}
