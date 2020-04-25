//
//  StandardSwiftCollectionViewViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class StandardSwiftCollectionViewViewController: CQBaseViewController {
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout.init()
        // 设置横向滚动or竖向滚动
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView!)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        // 可以通过此方法间接设置表头
        collectionView?.contentInset = UIEdgeInsets.init(top: 200, left: 0, bottom: 0, right: 0)
        let headerLabel = UILabel.init(frame: CGRect.init(x: 0, y: -200, width: self.view.size.width, height: 200))
        headerLabel.backgroundColor = .purple
        headerLabel.textAlignment = .center
        headerLabel.font = .boldSystemFont(ofSize: 30)
        headerLabel.text = "这是表头"
        collectionView?.addSubview(headerLabel)
        
        // 注册cell
        collectionView?.register(StandardSwiftCollectionViewCell.self, forCellWithReuseIdentifier: StandardSwiftCollectionViewCell.className())
        // 注册组头
        collectionView?.register(StandardSwiftCollectionViewSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StandardSwiftCollectionViewSectionHeaderView.className())
        // 注册组尾
        collectionView?.register(StandardSwiftCollectionViewSectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: StandardSwiftCollectionViewSectionFooterView.className())
        
        // 第一个cell为选中状态
        collectionView?.selectItem(at: IndexPath.init(item: 0, section: 0), animated: false, scrollPosition: .top)
    }

}

extension StandardSwiftCollectionViewViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StandardSwiftCollectionViewCell.className(), for: indexPath)
        
        return cell
    }
    
    // item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
    
    // 组的inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 12, bottom: 10, right: 12)
    }
    
    // 最小行距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    // 最小间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    // 高亮配置
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .orange
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .blue
//    }

}
