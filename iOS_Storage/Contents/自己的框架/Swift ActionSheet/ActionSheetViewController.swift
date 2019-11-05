//
//  ActionSheetViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ActionSheetViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let button = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        button.backgroundColor = .orange
        button.setTitle("呵呵哒", for: .normal)
        view.addSubview(button)
        
        
        let a = "  sssssssssss  "
        print(a)
        print(a.removeBothEndsWhiteSpace())
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ActionSheet.show(on: self.view)
    }

}
