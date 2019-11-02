//
//  Loading.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/1.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class Loading: UIView {
    
    /// 默认背景颜色
    private static let defaultBackgroundColor: UIColor = .white
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    class func show() -> Loading {
        return Loading.show(on: ((UIApplication.shared.delegate?.window)!)!)
    }

    class func show(on view: UIView) -> Loading {
        return Loading.show(on: view, backgroundColor: defaultBackgroundColor)
    }
    
    @discardableResult
    class func show(on view: UIView, backgroundColor: UIColor) -> Loading {
        let loading = Loading()
        view.addSubview(loading)
        loading.snp.makeConstraints { (make) in
            make.left.top.width.height.equalToSuperview()
        }
        return loading
    }
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        
    }
    
}
