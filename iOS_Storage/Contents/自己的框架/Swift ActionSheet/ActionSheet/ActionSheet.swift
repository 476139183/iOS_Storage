//
//  ActionSheet.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class ActionSheet: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - show
    
    class func show(on view: UIView) {
        
        remove(from: view)
        
        let actionSheet = ActionSheet()
        
        actionSheet.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        view.addSubview(actionSheet)
        actionSheet.snp.makeConstraints { (make) in
            make.left.right.width.height.equalToSuperview()
        }
        
        actionSheet.superview!.layoutIfNeeded()
        
//        UIView.animate(withDuration: 0.3, delay: 0.1, options: .allowAnimatedContent, animations: {
//            actionSheet.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//            actionSheet.contentView.snp.remakeConstraints { (make) in
//                make.left.right.bottom.equalToSuperview()
//                make.height.equalTo(200)
//            }
//            actionSheet.layoutIfNeeded()
//        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3) {
            actionSheet.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            actionSheet.contentView.snp.remakeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(200)
            }
            actionSheet.layoutIfNeeded()
        }
    }
    
    class func remove(from view: UIView) {
        for subview in view.subviews {
            if subview.isMember(of: self) {
                subview.removeFromSuperview()
            }
        }
    }

    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
        
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        contentView.addSubview(confirmButton)
        confirmButton.frame = CGRect(x: 20, y: 20, width: 90, height: 50)
        
    }
    
    
    // MARK: - action
    
    @objc private func confirmButtonClicked() {
        dismiss()
    }
    
    @objc private func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.contentView.snp.remakeConstraints { (make) in
                make.top.equalTo(self.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(200)
            }
            self.layoutIfNeeded()
        }) { (isFinished) in
            self.removeFromSuperview()
        }
    }
    
}
