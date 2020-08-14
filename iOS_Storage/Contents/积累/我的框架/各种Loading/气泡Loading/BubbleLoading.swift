//
//  DSLoading.swift
//  mobile
//
//  Created by caiqiang on 2020/3/5.
//  Copyright © 2020 DingStock. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

/// 波浪 loading
class BubbleLoading: UIView {

    class func show(on view: UIView, edge: UIEdgeInsets = .zero, loadingY: CGFloat = 20) {
        DispatchQueue.main.async {
            remove(from: view)
            
            let loading = BubbleLoading.init(y: loadingY)
            view.addSubview(loading)
            
            let top = edge.top
            let left = edge.left
            let right = edge.right
            let bottom = edge.bottom
            
            loading.snp.makeConstraints { (make) in
                make.top.equalTo(top)
                make.left.equalTo(left)
                make.width.equalToSuperview().offset(-left-right)
                make.height.equalToSuperview().offset(-top-bottom)
            }
            
        }
    }
    
    class func remove(from superView: UIView) {
        for view in superView.subviews {
            if view.isMember(of: BubbleLoading.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    // MARK: -
    
    private lazy var loadingView: NVActivityIndicatorView = {
        let view = NVActivityIndicatorView(frame: CGRect.init(x: (self.width-100)/2, y: self.loadingY, width: 100, height: 40), type: .ballPulse, color: UIColor.colorWithHexString("#e0e0e0"), padding: 5)
        view.startAnimating()
        return view
    }()
    
    var loadingY: CGFloat = 20
    
    init(y: CGFloat = 0) {
        super.init(frame: .zero)
        
        backgroundColor = .red
        self.loadingY = y
        addSubview(loadingView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingView.frame = CGRect.init(x: self.width/2-50, y: self.loadingY, width: 100, height: 40)
    }
    
}
