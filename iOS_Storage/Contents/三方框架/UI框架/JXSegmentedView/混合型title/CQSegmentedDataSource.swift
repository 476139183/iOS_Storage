//
//  CQSegmentedDataSource.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/5.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class CQSegmentedDataSource: JXSegmentedBaseDataSource {
    
    override func reloadData(selectedIndex: Int) {
        super.reloadData(selectedIndex: selectedIndex)

        let titleModel = JXSegmentedTitleItemModel()
        titleModel.title = "我只是title"
        titleModel.titleSelectedFont = .boldSystemFont(ofSize: 18)
        //titleModel.isTitleZoomEnabled = true
        dataSource.append(titleModel)

        let titleImageModel = JXSegmentedTitleImageItemModel()
        titleImageModel.title = "图片"
        // 只有图片
        titleImageModel.titleImageType = .onlyImage
        titleImageModel.normalImageInfo = "https://upload.jianshu.io/users/upload_avatars/1692043/89793122f9d1?imageMogr2/auto-orient/strip"
        titleImageModel.loadImageClosure = {(imageView, normalImageInfo) in
            if let image = UIImage(named: normalImageInfo) {
                imageView.image = image
            } else {
                //let url = URL(string: normalImageInfo)
                let string = normalImageInfo.removingPercentEncoding
                let url = URL.init(string: string ?? "")
                imageView.kf.setImage(with: url)
            }
        }
        titleImageModel.imageSize = CGSize(width: 20, height: 20)
        titleImageModel.isImageZoomEnabled = true
        titleImageModel.imageSelectedZoomScale = 1.3
        dataSource.append(titleImageModel)

        let numberModel = JXSegmentedNumberItemModel()
        numberModel.title = "数字"
        numberModel.number = 33
        numberModel.numberString = "33"
        numberModel.numberWidthIncrement = 10
        dataSource.append(numberModel)
        
        for (index, model) in (dataSource as! [JXSegmentedTitleItemModel]).enumerated() {
            if index == selectedIndex {
                model.isSelected = true
                model.titleCurrentColor = model.titleSelectedColor
                break
            }
        }
    }

    override func preferredSegmentedView(_ segmentedView: JXSegmentedView, widthForItemAt index: Int) -> CGFloat {
        //根据不同的cell类型返回对应的cell宽度
        var otherWidth: CGFloat = 0
        var title: String?
        var titleNormalFont: UIFont?
        if let itemModel = dataSource[index] as? JXSegmentedTitleItemModel {
            title = itemModel.title
            titleNormalFont = itemModel.titleNormalFont
        }else if let itemModel = dataSource[index] as? JXSegmentedTitleImageItemModel {
            title = itemModel.title
            titleNormalFont = itemModel.titleNormalFont
            otherWidth += itemModel.titleImageSpacing + itemModel.imageSize.width
        }else if let itemModel = dataSource[index] as? JXSegmentedNumberItemModel {
            title = itemModel.title
            titleNormalFont = itemModel.titleNormalFont
        }else if let itemModel = dataSource[index] as? JXSegmentedDotItemModel {
            title = itemModel.title
            titleNormalFont = itemModel.titleNormalFont
        }

        let textWidth = NSString(string: title!).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: segmentedView.bounds.size.height), options: NSStringDrawingOptions.init(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes: [NSAttributedString.Key.font : titleNormalFont!], context: nil).size.width
        let itemWidth = CGFloat(ceilf(Float(textWidth))) + itemWidthIncrement + otherWidth
        return itemWidth
    }

    //MARK: - JXSegmentedViewDataSource
    override func registerCellClass(in segmentedView: JXSegmentedView) {
        segmentedView.collectionView.register(JXSegmentedTitleCell.self, forCellWithReuseIdentifier: "titleCell")
        segmentedView.collectionView.register(JXSegmentedTitleImageCell.self, forCellWithReuseIdentifier: "titleImageCell")
        segmentedView.collectionView.register(JXSegmentedNumberCell.self, forCellWithReuseIdentifier: "numberCell")
        segmentedView.collectionView.register(JXSegmentedDotCell.self, forCellWithReuseIdentifier: "dotCell")
    }

    override func segmentedView(_ segmentedView: JXSegmentedView, cellForItemAt index: Int) -> JXSegmentedBaseCell {
        var cell:JXSegmentedBaseCell?
        if dataSource[index] is JXSegmentedTitleImageItemModel {
            cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "titleImageCell", at: index)
        }else if dataSource[index] is JXSegmentedNumberItemModel {
            cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "numberCell", at: index)
        }else if dataSource[index] is JXSegmentedDotItemModel {
            cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "dotCell", at: index)
        }else if dataSource[index] is JXSegmentedTitleItemModel {
            cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "titleCell", at: index)
        }
        return cell!
    }

    //针对不同的cell处理选中态和未选中态的刷新
    override func refreshItemModel(_ segmentedView: JXSegmentedView, currentSelectedItemModel: JXSegmentedBaseItemModel, willSelectedItemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        super.refreshItemModel(segmentedView, currentSelectedItemModel: currentSelectedItemModel, willSelectedItemModel: willSelectedItemModel, selectedType: selectedType)

        guard let myCurrentSelectedItemModel = currentSelectedItemModel as? JXSegmentedTitleItemModel, let myWilltSelectedItemModel = willSelectedItemModel as? JXSegmentedTitleItemModel else {
            return
        }

        myCurrentSelectedItemModel.titleCurrentColor = myCurrentSelectedItemModel.titleNormalColor

        myWilltSelectedItemModel.titleCurrentColor = myWilltSelectedItemModel.titleSelectedColor
    }

}
