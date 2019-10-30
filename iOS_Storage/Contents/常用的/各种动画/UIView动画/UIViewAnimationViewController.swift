//
//  UIViewAnimationViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class UIViewAnimationViewController: CQBaseViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "number_1")
        return imageView
    }()
    private lazy var bottomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "number_2")
        return imageView
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
        
        redView.frame = CGRect(x: 20, y: kNavigationBarHeight + 20, width: 80, height: 40)
        
        greenView.frame = CGRect(x: 20, y: redView.frame.origin.y + 60, width: 80, height: 40)
        topImageView.frame = greenView.bounds
        bottomImageView.frame = greenView.bounds
        greenView.addSubview(bottomImageView)
        greenView.addSubview(topImageView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        springAnimation()
        clipAnimation()
    }
    
    // MARK: - 弹性动画
    private func springAnimation() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            self.redView.frame = CGRect(x: 60, y: kNavigationBarHeight + 20, width: 150, height: 40)
        }) { (isFinished) in
            print("弹性动画结束")
        }
    }
    
    // MARK: - 翻转动画
    private func clipAnimation() {
        // 从左边翻转
        UIView.transition(from: topImageView, to: bottomImageView, duration: 1, options: .transitionFlipFromLeft) { (isFinished) in
            print("翻转动画结束")
        }
    }

}
