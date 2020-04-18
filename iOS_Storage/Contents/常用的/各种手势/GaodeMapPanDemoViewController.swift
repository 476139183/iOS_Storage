//
//  GaodeMapPanDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GaodeMapPanDemoViewController: UIViewController {
    
    // 最大高度
    let panViewMaxHeight: CGFloat = 500
    // 最小高度
    let panViewMinHeight: CGFloat = 200
    
    private lazy var panView: PanView = {
        let view = PanView()
        view.touchMovedClosure = { [weak self] (touch, event) in
            self?.handleMoved(touch: touch, event: event)
        }
        view.touchEndedClosure = { [weak self] (touch, event) in
            self?.handleMovedEnded(touch: touch, event: event)
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(panView)
        panView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
        
    }
    
    private func handleMoved(touch: UITouch, event: UIEvent) {
        
        let currentPoint: CGPoint = (touch.location(in: panView))
        let prePoint: CGPoint = (touch.previousLocation(in: panView))
        
        let offsetY = currentPoint.y - prePoint.y
        let height = self.panView.frame.size.height - offsetY
        
        //print(touch.phase.rawValue)
        
        // 不能比初始高度小，不能遮住导航栏
        if height <= panViewMaxHeight, height >= panViewMinHeight {
            self.panView.snp.remakeConstraints { (make) in
                make.height.equalTo(height)
                make.left.right.bottom.equalToSuperview()
            }
        }
        
        let set: Set<UITouch> = event.allTouches!
        for touch in set {
            if touch.phase == .stationary {
                continue
            }
            let point = touch.location(in: panView)
            let prePoint = touch.previousLocation(in: panView)
            
            let offset = point.y - prePoint.y
            print(offset)
            
            
            // 0.0 表示静止（可以用绝对值<1表示）
            // 大于0表示向下
            // 小于0表示向上
            
        }
        
    }
    
    private func handleMovedEnded(touch: UITouch, event: UIEvent) {
        
        // 这里通过方向来判断
        
        let currentPoint: CGPoint = (touch.location(in: panView))
        let prePoint: CGPoint = (touch.previousLocation(in: panView))
        
        let offsetY = currentPoint.y - prePoint.y
        //print(offsetY)
//        print(offsetY)
//
//        print(touch.phase.rawValue)
        
    }

}


fileprivate class PanView: UIView {
    
    var touchMovedClosure: ((_ touch: UITouch, _ event: UIEvent)->())?
    var touchEndedClosure: ((_ touch: UITouch, _ event: UIEvent)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        let label = UILabel()
        addSubview(label)
        label.text = "盘它"
        label.font = .boldSystemFont(ofSize: 22)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first, let event = event {
            touchMovedClosure?(touch, event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let event = event {
            touchEndedClosure?(touch, event)
        }
    }
    
}
