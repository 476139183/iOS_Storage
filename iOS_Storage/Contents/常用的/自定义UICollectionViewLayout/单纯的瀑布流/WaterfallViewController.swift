//
//  WaterfallViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/18.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class WaterfallViewController: CQBaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private lazy var dataArray: [String] = {
        return ["不得不承认", "有时候", "肌肉比头脑好用", "把帅气的男朋友带回家", "男神是孟德", "听离歌"]
    }()
    
    private lazy var layout: WaterfallLayout = {
        let layout = WaterfallLayout()
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.className())
        return collectionView
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.className(), for: indexPath) as? MyCell
        cell?.title = dataArray[indexPath.row]
        cell?.deleteClosure = {
            self.dataArray.remove(at: indexPath.row)
            self.collectionView.reloadData()
        }
        return cell!
    }

}


// MARK: - cell

fileprivate class MyCell: UICollectionViewCell {
    
    var deleteClosure: (() -> ())?
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Lazy
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor.colorWithHexString("#373D4D")
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(IconFont.close, for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = IconFont.font(size: 8)
        button.setEnlargeEdgeWithTop(10, right: 10, bottom: 10, left: 10)
        button.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    
    private func setupUI() {
        
        contentView.backgroundColor = UIColor.colorWithHexString("#F5F5F5")
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(deleteButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.left.top.equalTo(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        deleteButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 8, height: 8))
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
    }
    
    
    // MARK: - action
    
    @objc private func deleteButtonClicked() {
        if let closure = self.deleteClosure {
            closure()
        }
    }
    
}
