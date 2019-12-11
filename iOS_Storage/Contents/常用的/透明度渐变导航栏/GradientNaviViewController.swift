//
//  GradientNaviViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class GradientNaviViewController: CQBaseViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var naviView: NaviView = {
        let naviView = NaviView()
        naviView.backClosure = { [weak self] in
            self?.handleBackButtonClicked()
        }
        return naviView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.delegate = self
        
        view.addSubview(tableView)
        view.addSubview(naviView)
        
        tableView.frame = view.bounds
        naviView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavigationBarHeight)
    }
    
    
    // MARK: - action
    
    @objc private func handleBackButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UITableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseID)
        }
        cell?.textLabel!.text = "\(indexPath.row) - 滑动显示导航栏"
        return cell!
    }
    
    // MARK: - UIScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        naviView.contentView.alpha = (scrollView.contentOffset.y - kNavigationBarHeight) / 100.0
    }
    
    // MARK: - UINavigationController Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 把系统的导航栏隐藏了
        let shouldHidden = self.isMember(of: GradientNaviViewController.self)
        self.navigationController?.setNavigationBarHidden(shouldHidden, animated: animated)
    }

}


// MARK: - 导航栏

fileprivate class NaviView: UIView {
    
    // MARK: - Public
    
    var backClosure: (() -> ())?
    
    /// 通过改变这个view的alpha来实现渐变
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.alpha = 0
        return view
    }()
    
    
    // MARK: - Private
    
    private lazy var redBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "这是导航栏"
        return label
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(redBackButton)
        addSubview(contentView)
        contentView.addSubview(greenBackButton)
        contentView.addSubview(titleLabel)
        
        redBackButton.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        greenBackButton.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(greenBackButton)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - action
    
    @objc private func backButtonClicked() {
        backClosure?()
    }
    
}
