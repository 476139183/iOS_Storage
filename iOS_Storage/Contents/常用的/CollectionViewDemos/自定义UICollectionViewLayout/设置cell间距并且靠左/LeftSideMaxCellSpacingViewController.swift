//
//  LeftSideMaxCellSpacingViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeftSideMaxCellSpacingViewController: CQBaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //private let dataArray: [String] = ["不得不承认", "有时候", "肌肉比头脑好用", "来和妲己玩耍吧", "哭了", "难受", "把帅气的男朋友带回家"]
    private let dataArray: [String] = ["把帅气的男朋友带回家，把帅气的男朋友带回家", "把帅气的男朋友带回家，把帅气的男朋友带回家"]

    private lazy var layout: LeftSideMaxCellSpacingLayout = {
        let layout = LeftSideMaxCellSpacingLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 20)
        layout.maximumInteritemSpacing = 15
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.className(), for: indexPath) as? MyCell
        cell?.text = dataArray[indexPath.row]
        return cell!
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
