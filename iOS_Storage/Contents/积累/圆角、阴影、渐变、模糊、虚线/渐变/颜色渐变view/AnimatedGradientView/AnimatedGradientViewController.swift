//
//  AnimatedGradientViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/9.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import AnimatedGradientView

class AnimatedGradientViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
        (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
        (colors: ["#003973", "#E5E5BE"], .down, .axial),
        (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
        view.addSubview(animatedGradient)
        animatedGradient.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(naviBarHeight)
            make.height.equalTo(300)
        }
        
        let gradient = AnimatedGradientView(frame: view.bounds)
        gradient.colors = [[UIColor.white, UIColor.red, UIColor.white]]
        gradient.direction = .left
        gradient.autoAnimate = false
        gradient.type = .axial
        view.addSubview(gradient)
        gradient.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(animatedGradient.snp.bottom).offset(30)
            make.height.equalTo(300)
        }
        
    }
    
}
