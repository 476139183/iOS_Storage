//
//  BlurEffectViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BlurEffectViewController: CQBaseViewController {
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect.init(style: .light)
        blurView.effect = blurEffect
    }
    
    @IBAction func alphaChanged(_ sender: UISlider) {
        blurView.alpha = CGFloat(sender.value)
    }
    
    @IBAction func blurChanged(_ sender: UISlider) {
        
    }
    
    
}
