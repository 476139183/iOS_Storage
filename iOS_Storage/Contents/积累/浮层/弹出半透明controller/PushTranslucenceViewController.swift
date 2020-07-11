//
//  PushTranslucenceViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PushTranslucenceViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "点击弹出"
        label.frame = view.bounds
        label.textAlignment = .center
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TranslucenceViewController()
        present(vc, animated: false, completion: nil)
    }
    
}

// 这个是半透明 vc
fileprivate class TranslucenceViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        // 在构造方法里加上这句是关键，是构造方法，不是 viewDidLoad
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 用来做动画的view
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("back", for: .normal)
        button.addTarget(self, action: #selector(bacKButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(contentView)
        contentView.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        let label = UILabel()
        contentView.addSubview(label)
        label.text = "这个是半透明VC"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentView.frame = .init(x: 0, y: kScreenHeight, width: screenWidth, height: 0)
        // 入场动画
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.contentView.frame = .init(x: 0, y: kNavigationBarHeight, width: screenWidth, height: kScreenHeight-kNavigationBarHeight)
        })
    }
    
    
    @objc private func bacKButtonClicked() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.contentView.y = screenHeight
        }) { (finished) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}
