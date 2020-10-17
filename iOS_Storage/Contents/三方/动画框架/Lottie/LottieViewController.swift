//
//  LottieViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/24.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: CQBaseViewController {
    
    private lazy var lotView: AnimationView = {
        let view = AnimationView(name: "白色")
        // lottie 不支持3D
        //let view = AnimationView(name: "tabbar_find")
        view.loopMode = .loop
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        lotView.frame = .init(x: 0, y: kNavigationBarHeight, width: 100, height: 100)
        view.addSubview(lotView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 播放动画
        lotView.play()
    }
}
