//
//  AnimationHudViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class AnimationHudViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.setTitle("show", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    

    @objc private func buttonClicked() {
        let myView = CustomView()
        myView.size = .init(width: 200, height: 200)
        AnimationHud.show(with: myView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let alertVC = UIAlertController.init(title: "弹弹弹", message: "message", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction.init(title: "cancel", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
        //        self.presend
    }

}

fileprivate class CustomView: UIView {
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .red
        
        addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
}
