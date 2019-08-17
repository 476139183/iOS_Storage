//
//  ResponseAreaTestViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/14.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ResponseAreaTestViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let redView = RedView()
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.snp.centerY)
            make.height.equalTo(200)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("点击了controller的view")
    }
    
}


/// 扫一扫按钮
fileprivate class ScanButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 设置响应区域
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let buttonWidth: CGFloat = self.width
        // 可响应区域圆的直径
        let circleWidth: CGFloat = 140
        
        let origionX  = (buttonWidth - circleWidth) / 2
        
        // 可响应区域的frame
        let frame = CGRect.init(x: origionX, y: origionX, width: circleWidth, height: circleWidth)
        // 画一个圈
        let circle = UIBezierPath.init(ovalIn: frame)
        
        return circle.contains(point)
    }
    
    private func setupUI() {
        self.setImage(UIImage.init(named: "bt_scan_add"), for: .normal)
        
        let scanImageView = UIImageView.init(image: UIImage.init(named: "ic_ex_scan_addfriend"))
        self.addSubview(scanImageView)
        scanImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 36, height: 36))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-15)
        }
        
        let scanLabel = UILabel()
        self.addSubview(scanLabel)
        scanLabel.text = "扫一扫加好友"
        scanLabel.textColor = .white
        scanLabel.font = .systemFont(ofSize: 14)
        scanLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(scanImageView.snp.bottom).offset(16)
            make.height.equalTo(14)
        }
    }
}

fileprivate class RedView: UIView {
    /// 扫一扫按钮
    private let scanButton = ScanButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        let tapGesture = UITapGestureRecognizer.init { (_) in
            print("红色view tap")
        }
        addGestureRecognizer(tapGesture)
        
        
        //-------- 扫一扫按钮 --------//
        self.addSubview(scanButton)
        scanButton.backgroundColor = .yellow
        scanButton.addTarget(self, action: #selector(scanButtonClicked), for: .touchUpInside)
        scanButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 204, height: 204))
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.snp.top)
        }
        
    }
    
    @objc private func scanButtonClicked() {
        print("按钮点击")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 方法一
    //override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    //    // 直接返回true
    //       响应区域全开
    //    return true
    //}
    
    
    // 方法二
    // 重新设定响应view
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 坐标转换
        let tempPoint = self.scanButton.convert(point, from: self)
        // 判断点击点是否在button上
        if self.scanButton.point(inside: tempPoint, with: event) {
            return self.scanButton
        }
        return super.hitTest(point, with: event)
    }
}
