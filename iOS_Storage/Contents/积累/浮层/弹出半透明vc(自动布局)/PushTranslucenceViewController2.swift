//
//  PushTranslucenceViewController2.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PushTranslucenceViewController2: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "点击弹出"
        label.frame = view.bounds
        label.textAlignment = .center
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
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
        
        let clearButton = UIButton()
        view.addSubview(clearButton)
        clearButton.backgroundColor = .clear
        clearButton.addTarget(self, action: #selector(bacKButtonClicked), for: .touchUpInside)
        clearButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
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
            make.left.equalTo(100)
            make.right.equalTo(-100)
            make.top.equalTo(100)
            make.bottom.equalTo(-100)
        }
        
        
        prepareAnimation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startAnimation()
    }
    
    @objc private func bacKButtonClicked() {
        dismissAnimation()
    }
    
    /// 准备动画
    private func prepareAnimation() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        self.contentView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.snp.bottom)
        }
        
        self.contentView.layoutIfNeeded()
        self.view.layoutIfNeeded()
    }
    
    /// 开启动画
    private func startAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            self.contentView.snp.remakeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.snp.bottom)
            }
            
            self.view.layoutIfNeeded()
            self.contentView.layoutIfNeeded()
        }
    }
    
    /// 结束动画
    private func dismissAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.contentView.y = screenHeight
        }) { (finished) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}
