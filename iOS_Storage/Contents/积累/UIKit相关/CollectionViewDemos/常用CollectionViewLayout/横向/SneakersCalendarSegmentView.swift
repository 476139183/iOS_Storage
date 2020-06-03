//
//  SneakersCalendarSegmentView.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SneakersCalendarSegmentView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - 接口
    
    /// title 数组
    var titles: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    /// 设置第几个 cell 处于选中状态
    var selectedIndex: Int! = 0 {
        didSet {
            self.collectionView.superview?.layoutIfNeeded()
            let indexPath = IndexPath.init(row: selectedIndex, section: 0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        }
    }
    
    /// cell 选中回调
    var cellSelectedClosure: ((_ index: Int) -> ())?
    
    // MARK: -
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = .init(width: 48, height: 30)
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(MonthCell.self, forCellWithReuseIdentifier: MonthCell.className())
        
        return collectionView
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCell.className(), for: indexPath) as! MonthCell
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        cellSelectedClosure?(indexPath.row)
    }
    
}


// MARK: - Cell

fileprivate class MonthCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: UIFont.SFProText_Regular, size: 12)
        label.textColor = UIColor.colorWithHexString("contentView.addSubview(titleLabel)")
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
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.colorWithHexString("#989899").cgColor
        contentView.layer.borderWidth = 0.5
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.font = UIFont.init(name: UIFont.SFProText_Bold, size: 12)
                contentView.layer.borderColor = UIColor.black.cgColor
                contentView.layer.borderWidth = 1
                contentView.backgroundColor = UIColor.colorWithHexString("#F1F1F1")
            } else {
                titleLabel.font = UIFont.init(name: UIFont.SFProText_Regular, size: 12)
                contentView.layer.borderColor = UIColor.colorWithHexString("#989899").cgColor
                contentView.layer.borderWidth = 0.5
                contentView.backgroundColor = .white
            }
        }
    }
    
}
