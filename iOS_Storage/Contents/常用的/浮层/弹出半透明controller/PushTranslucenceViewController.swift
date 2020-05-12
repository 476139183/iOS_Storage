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
        present(vc, animated: true, completion: nil)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "这个是半透明VC"
        label.textColor = .red
        label.font = .systemFont(ofSize: 15)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}
