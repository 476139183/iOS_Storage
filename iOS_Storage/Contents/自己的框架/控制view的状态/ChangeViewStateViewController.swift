//
//  ChangeViewStateViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/20.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ChangeViewStateViewController: CQBaseViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var loadingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("loading", for: .normal)
        button.addTarget(self, action: #selector(loadingButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var normalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("normal", for: .normal)
        button.addTarget(self, action: #selector(normalButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var emptyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("empty", for: .normal)
        button.addTarget(self, action: #selector(emptyButtonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(150)
        }
        
        view.addSubview(loadingButton)
        view.addSubview(normalButton)
        view.addSubview(emptyButton)
        
        loadingButton.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        normalButton.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(loadingButton)
            make.right.equalTo(loadingButton.snp.left).offset(-10)
        }
        
        emptyButton.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(loadingButton)
            make.left.equalTo(loadingButton.snp.right).offset(10)
        }
        
    }
    
    @objc private func loadingButtonClicked() {
        self.tableView.changeToState(.loading)
    }
    
    @objc private func normalButtonClicked() {
        self.tableView.changeToState(.normal)
    }
    
    @objc private func emptyButtonClicked() {
        self.tableView.changeToState(.empty)
    }

}
