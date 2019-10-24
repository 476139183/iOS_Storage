//
//  LottieViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LottieViewController: CQBaseViewController {
    
    private lazy var lotView: LOTAnimationView = {
        let view = LOTAnimationView(name: "LottieLogo1")
        view.loopAnimation = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        lotView.frame = self.view.bounds
        view.addSubview(lotView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 播放动画
        lotView.play()
    }
}
