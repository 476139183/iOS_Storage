//
//  XibEasyButtonViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class XibEasyButtonViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClicked(_ sender: EasyButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.dsImageView.image!.isEqualToImage(image: UIImage.init(named: "AJ1")!) {
            print("equal")
        }
        
    }

}
