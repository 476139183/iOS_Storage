//
//  LeftSideMaxCellSpacingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeftSideMaxCellSpacingViewController: CQBaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //private let dataArray: [String] = ["不得不承认", "有时候", "肌肉比头脑好用", "来和妲己玩耍吧", "哭了", "难受", "把帅气的男朋友带回家"]
    private let dataArray: [String] = ["把帅气的男朋友带回家，把帅气的男朋友带回家", "不得不承认", "有时候", "肌肉比头脑好用", "来和妲己玩耍吧", "哭了", "难受", "把帅气的男朋友带回家"]

    private lazy var layout: UICollectionViewLeftAlignedLayout = {
        let layout = UICollectionViewLeftAlignedLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 20)
        layout.minimumInteritemSpacing = 3
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.className())
        // 注册组头
        collectionView.register(StandardSwiftCollectionViewSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StandardSwiftCollectionViewSectionHeaderView.className())
        // 注册组尾
        collectionView.register(StandardSwiftCollectionViewSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: StandardSwiftCollectionViewSectionFooterView.className())
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(kNavigationBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.className(), for: indexPath) as? MyCell
        cell?.text = dataArray[indexPath.row]
        return cell!
    }
    
    // 组头size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.size.width, height: 40)
    }
    
    // 组尾size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: view.size.width, height: 50)
    }
    
    // 组头&&组尾
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            // 组头
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StandardSwiftCollectionViewSectionHeaderView.className(), for: indexPath)
            
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: StandardSwiftCollectionViewSectionFooterView.className(), for: indexPath) as? StandardSwiftCollectionViewSectionFooterView
            footer?.title = "组尾"
            return footer!
        }
    }
    

}


/// 宽度自适应的cell
fileprivate class MyCell: UICollectionViewCell {
    
    var text: String? {
        didSet {
            if let text = text {
                label.text = "   \(text)   "
            }
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .orange
        contentView.layer.cornerRadius = 10
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
