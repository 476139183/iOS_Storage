//
//  PullDownLargeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/11.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class PullDownLargeViewController: CQBaseViewController, UITableViewDataSource, UITableViewDelegate,  UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    /// 表头高度
    let kTableHeaderViewHeight: CGFloat = 260
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        let header = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kTableHeaderViewHeight))
        tableView.tableHeaderView = header
        header.addSubview(tableHeaderView)
        return tableView
    }()
    
    /// 表头
    private lazy var tableHeaderView: TableHeaderView = {
        let header = TableHeaderView.init(frame: .init(x: 0, y: 0, width: kScreenWidth, height: kTableHeaderViewHeight))
        header.backButtonClickedClosure = { [weak self] in
            self?.handleBackButtonClicked()
        }
        return header
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    
    // MARK: - action
    
    private func handleBackButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UIScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 { // 下拉
            tableHeaderView.frame = .init(x: 0, y: offsetY, width: kScreenWidth, height: kTableHeaderViewHeight + abs(offsetY))
        } else {
            tableHeaderView.frame = .init(x: 0, y: 0, width: kScreenWidth, height: kTableHeaderViewHeight)
        }
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
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    
    
    // MARK: - UINavigationController Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 把系统的导航栏隐藏掉
        let shouldHidden = viewController.isMember(of: PullDownLargeViewController.self)
        self.navigationController?.setNavigationBarHidden(shouldHidden, animated: animated)
    }
    
}


// MARK: - 表头

fileprivate class TableHeaderView: UIView {
    
    var backButtonClickedClosure: (() -> ())?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("返回上一页", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iu_header")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(backButton)
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.left.equalTo(30)
            make.top.equalTo(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonClicked() {
        backButtonClickedClosure?()
    }
    
}

