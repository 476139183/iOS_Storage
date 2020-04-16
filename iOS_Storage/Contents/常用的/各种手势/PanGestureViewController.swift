//
//  PanGestureViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PanGestureViewController: UIViewController {
    
    let blueLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "平移手势"
        
        view.addSubview(blueLabel)
        blueLabel.backgroundColor = .blue
        blueLabel.isUserInteractionEnabled = true
        blueLabel.textAlignment = .center
        blueLabel.text = "pan 它！"
        blueLabel.size = .init(width: 200, height: 200)
        blueLabel.center = view.center
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(viewPaned(sender:)))
        blueLabel.addGestureRecognizer(panGesture)
        
    }
    
    @objc private func viewPaned(sender: UIPanGestureRecognizer) {
        let offsetPoint = sender.translation(in: blueLabel)
        blueLabel.transform = blueLabel.transform.translatedBy(x: offsetPoint.x, y: offsetPoint.y)
        sender.setTranslation(.zero, in: blueLabel)
        print(blueLabel.frame)
    }
    
}
