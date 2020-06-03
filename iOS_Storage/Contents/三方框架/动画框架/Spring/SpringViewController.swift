//
//  SpringViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Spring

class SpringViewController: CQBaseViewController {
    
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 1
    var selectedDuration: CGFloat = 1
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    
    private lazy var ballView: SpringView = {
        let imageView = SpringView()
        //imageView.image = UIImage.init(named: "iu")
        imageView.backgroundColor = .orange
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(ballView)
        ballView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateView()
    }
    
    
    func animateView() {
        setOptions()
        ballView.animate()
    }
    
    func setOptions() {
        ballView.force = selectedForce
        ballView.duration = selectedDuration
        ballView.delay = selectedDelay
        
        ballView.damping = selectedDamping
        ballView.velocity = selectedVelocity
        ballView.scaleX = selectedScale
        ballView.scaleY = selectedScale
//        ballView.x = selectedX
        //        ballView.y = selectedY
        ballView.rotate = selectedRotate
        
        ballView.animation = Spring.AnimationPreset.Flash.rawValue
        ballView.curve = animationCurves[2].rawValue
        
    }
    
    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]
    
    var animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]

}
