//
//  AnimationHud.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

class AnimationHud: UIView {
    
    static func show(with view: UIView) {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        let hud = AnimationHud.init()
        hud.frame = UIScreen.main.bounds
        window?.addSubview(hud)
        
        view.isHidden = true
        hud.addSubview(view)
        hud.layoutIfNeeded()
        view.snp.makeConstraints { (make) in
            make.size.equalTo(view.size)
            make.center.equalToSuperview()
        }
        
        view.isHidden = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(hudTaped))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func hudTaped() {
        removeFromSuperview()
    }
    
    
    
}
