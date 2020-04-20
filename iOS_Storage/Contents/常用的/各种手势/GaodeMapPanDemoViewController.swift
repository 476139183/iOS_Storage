//
//  GaodeMapPanDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/16.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

// 拖动方向
fileprivate enum MoveDirection {
    case up     // 向上
    case down   // 向下
    case quiet  // 静止
}

class GaodeMapPanDemoViewController: UIViewController {
    
    private var direction = MoveDirection.quiet
    
    // 最大高度
    let panViewMaxHeight: CGFloat = 500
    // 最小高度
    let panViewMinHeight: CGFloat = 200
    
    private lazy var panView: PanView = {
        let view = PanView()
        view.touchMovedClosure = { [weak self] (touch) in
            self?.handleMoved(touch: touch)
        }
        view.touchEndedClosure = { [weak self] in
            self?.handleMovedEnded()
        }
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(panView)
        panView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(panViewMinHeight)
        }
        
    }
    
    
    private func handleMoved(touch: UITouch) {
        
        let currentPoint: CGPoint = (touch.location(in: panView))
        let prePoint: CGPoint = (touch.previousLocation(in: panView))
        
        let offsetY = currentPoint.y - prePoint.y
        
        print(offsetY)
        
        let height = self.panView.frame.size.height - offsetY
        // 拖动过程修改高度，不能比最大值大，不能比最小值小
        if height <= panViewMaxHeight, height >= panViewMinHeight {
            self.panView.snp.remakeConstraints { (make) in
                make.height.equalTo(height)
                make.left.right.bottom.equalToSuperview()
            }
        }
        
        // 获取拖动方向
        // 0.0 表示静止（可以用 绝对值<1 表示，非常非常轻微的拖动，看作是静止）
        // 大于0表示向下
        // 小于0表示向上
        if abs(offsetY) <= 1 {
            self.direction = .quiet
        } else if offsetY > 0 {
            self.direction = .down
        } else {
            self.direction = .up
        }
        
    }
    
    
    private func handleMovedEnded() {
        
        switch self.direction {
        case .up:
            UIView.animate(withDuration: 0.1) {
                self.panView.snp.remakeConstraints { (make) in
                    make.left.right.bottom.equalToSuperview()
                    make.height.equalTo(self.panViewMaxHeight)
                }
                self.panView.superview?.layoutIfNeeded()
            }
        case .down:
            UIView.animate(withDuration: 0.1) {
                self.panView.snp.remakeConstraints { (make) in
                    make.left.right.bottom.equalToSuperview()
                    make.height.equalTo(self.panViewMinHeight)
                }
                self.panView.superview?.layoutIfNeeded()
            }
        case .quiet:
            if self.panView.height() < (panViewMaxHeight+panViewMinHeight)/2 {
                UIView.animate(withDuration: 0.1) {
                    self.panView.snp.remakeConstraints { (make) in
                        make.left.right.bottom.equalToSuperview()
                        make.height.equalTo(self.panViewMinHeight)
                    }
                    self.panView.superview?.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.panView.snp.remakeConstraints { (make) in
                        make.left.right.bottom.equalToSuperview()
                        make.height.equalTo(self.panViewMaxHeight)
                    }
                    self.panView.superview?.layoutIfNeeded()
                }
            }
        }
        
    }
    

}


fileprivate class PanView: UIView {
    
    var touchMovedClosure: ((_ touch: UITouch)->())?
    var touchEndedClosure: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.colorWithHexString("#EBEDF0")
        
        self.layer.cornerRadius = 20
        
        self.layer.shadowColor = UIColor.colorWithHexString("#000000").withAlphaComponent(0.3).cgColor
        self.layer.shadowOffset = .init(width: 0, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 12
        
        let lineView = UIView()
        addSubview(lineView)
        lineView.backgroundColor = UIColor.colorWithHexString("#C2C7CC")
        lineView.layer.cornerRadius = 2
        lineView.snp.makeConstraints { (make) in
            make.width.equalTo(36)
            make.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.top.equalTo(12)
        }
        
        let label = UILabel()
        addSubview(label)
        label.text = "盘它"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 22)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(35)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            touchMovedClosure?(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEndedClosure?()
    }
    
}
