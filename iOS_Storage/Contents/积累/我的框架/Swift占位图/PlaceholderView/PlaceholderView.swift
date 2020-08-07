//
//  PlaceholderView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/31.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

/// 占位图类型
enum PlaceholderViewType {
    
    case noData       // 无数据
    case networkError // 网络错误
    case loadFailed   // 加载失败
    case noPost       // 没动态
    
    var image: UIImage {
        get {
            switch self {
            case .noData:
                return UIImage.init(named: "placeholder_noData")!
            case .networkError:
                return UIImage.init(named: "placeholder_networkError")!
            case .loadFailed:
                return UIImage.init(named: "placeholder_loadFailed")!
            case .noPost:
                return UIImage.init(named: "placeholder_noPost")!
            }
        }
    }
    
}

class PlaceholderView: UIView {
    
    /// 占位图点击回调
    typealias ViewTapedClosure = (() -> ())
    
    var type: PlaceholderViewType = .noData
    var title: String = ""
    var viewTapedClosure: ViewTapedClosure?
    
    
    // MARK: - show
    
    /// 在指定view上展示占位图,默认覆盖整个view,如需调整约束可以对返回值进行修改
    /// - Parameter view: 展示占位图的view
    /// - Parameter type: 占位图类型
    /// - Parameter title: title
    /// - Parameter tapedColsure: 占位图点击回调
    @discardableResult
    class func show(on view: UIView, type: PlaceholderViewType!, title: String!, tapedColsure: @escaping ViewTapedClosure) -> PlaceholderView {
        // 先移除已有的
        remove(from: view)
        
        let placeholderView = PlaceholderView(type: type, title: title, tapedColsure: tapedColsure)
        view.addSubview(placeholderView)
        placeholderView.snp.makeConstraints { (make) in
            make.top.left.width.height.equalToSuperview()
        }
        
        return placeholderView
    }
    
    
    // MARK: - remove
    
    class func remove(from view: UIView) {
        for subView in view.subviews {
            if subView.isMember(of: PlaceholderView.self) {
                subView.removeFromSuperview()
            }
        }
    }
    
    
    // MARK: - Lazy
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = UIColor.colorWithHexString("A0A9B5")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - init
    
    convenience init(type: PlaceholderViewType!, title: String!, tapedColsure: @escaping ViewTapedClosure) {
        self.init()
        
        self.type = type
        self.title = title
        self.viewTapedClosure = tapedColsure
        
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTaped))
        addGestureRecognizer(tapGesture)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func setupUI() {
        
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY).offset(30)
            make.width.equalTo(314)
        }
        imageView.image = type.image
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.left.equalTo(20)
            make.right.equalToSuperview().offset(-20)
        }
        titleLabel.text = title
    }
    
    
    // MARK: - action
    
    /// 点击占位图
    @objc private func viewTaped() {
        guard let closure = viewTapedClosure else {
            return
        }
        closure()
    }
    
}
