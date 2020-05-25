//
//  AnimationHud.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

enum AnimationHudType {
    case systemAlert
    case systemActionSheet
}

class AnimationHud: UIView {
    
    static func show(with view: UIView, type: AnimationHudType? = .systemAlert) {
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
        
        hud.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        hud.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            hud.alpha = 1
        }) { (finished) in
            
        }
        
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
