//
//  Loading.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/1.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Kingfisher

class Loading: UIView {
    
    /// 默认背景颜色
    private static let defaultBackgroundColor: UIColor = .clear
    /// 默认展示loading的window
    private static let defaultWindow = ((UIApplication.shared.delegate?.window)!)!
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let path = Bundle.main.path(forResource: "加载中", ofType: "gif")!
        // 加载gif会耗时，所以可能会空白1秒钟
        let resource = ImageResource(downloadURL: URL(fileURLWithPath: path))
        imageView.kf.setImage(with: resource)
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    
    // MARK: - show
    
    @discardableResult
    class func show() -> Loading {
        return Loading.show(on: ((UIApplication.shared.delegate?.window)!)!)
    }

    @discardableResult
    class func show(on view: UIView) -> Loading {
        return Loading.show(on: view, backgroundColor: defaultBackgroundColor)
    }
    
    @discardableResult
    class func show(on view: UIView, frame: CGRect) -> Loading {
        return Loading.show(on: view, frame: frame, backgroundColor: defaultBackgroundColor)
    }
    
    @discardableResult
    class func show(on view: UIView, backgroundColor: UIColor) -> Loading {
        return Loading.show(on: view, frame: nil, backgroundColor: backgroundColor)
    }
    
    @discardableResult
    class func show(on view: UIView, frame: CGRect?, backgroundColor: UIColor) -> Loading {
        // 先移除
        Loading.remove(from: view)
        
        let loading = Loading()
        view.addSubview(loading)
        loading.backgroundColor = backgroundColor
        
        // 传了frame就用frame，没传frame就默认覆盖整个view
        if let frame = frame {
            loading.frame = frame
        } else {
            loading.snp.makeConstraints { (make) in
                make.left.top.width.height.equalToSuperview()
            }
        }
        
        return loading
    }
    
    // MARK: - remove
    
    /// 移除loading，此方法跟show对应
    class func remove() {
        remove(from: defaultWindow)
    }
    
    /// 移除指定view上的loading，此方法跟show(on view)对应
    class func remove(from view: UIView) {
        for view in view.subviews {
            if view.isMember(of: Loading.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }
    
}
