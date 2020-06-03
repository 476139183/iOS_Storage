//
//  HomeSegmentedCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/6.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import JXSegmentedView

class HomeSegmentedCell: JXSegmentedTitleCell {
    
    public let imageView = UIImageView()
    private var currentImageInfo: String?

    open override func prepareForReuse() {
        super.prepareForReuse()

        currentImageInfo = nil
    }

    open override func commonInit() {
        super.commonInit()

        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        guard let myItemModel = itemModel as? JXSegmentedTitleImageItemModel else {
            return
        }
        
        
        
        imageView.center = CGPoint(x: contentView.bounds.size.width/2, y: contentView.bounds.size.height/2)
        titleLabel.center = CGPoint(x: contentView.bounds.size.width/2, y: contentView.bounds.size.height/2)
        
    }

    open override func reloadData(itemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        super.reloadData(itemModel: itemModel, selectedType: selectedType )

        guard let myItemModel = itemModel as? JXSegmentedTitleImageItemModel else {
            return
        }

        titleLabel.isHidden = false
        imageView.isHidden = false
        
        // 有图片则展示图片宽度
        if let image = myItemModel.normalImageInfo, image != "" {
            titleLabel.isHidden = true
        } else {
            imageView.isHidden = true
        }

        imageView.bounds = CGRect(x: 0, y: 0, width: myItemModel.imageSize.width, height: myItemModel.imageSize.height)

        var normalImageInfo = myItemModel.normalImageInfo
        if myItemModel.isSelected && myItemModel.selectedImageInfo != nil {
            normalImageInfo = myItemModel.selectedImageInfo
        }

        //因为`func reloadData(itemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType)`方法会回调多次，尤其是左右滚动的时候会调用无数次。如果每次都触发图片加载，会非常消耗性能。所以只会在图片发生了变化的时候，才进行图片加载。
        if normalImageInfo != nil && normalImageInfo != currentImageInfo {
            currentImageInfo = normalImageInfo
            if myItemModel.loadImageClosure != nil {
                myItemModel.loadImageClosure!(imageView, normalImageInfo!)
            }else {
                imageView.image = UIImage(named: normalImageInfo!)
            }
        }

        if myItemModel.isImageZoomEnabled {
            imageView.transform = CGAffineTransform(scaleX: myItemModel.imageCurrentZoomScale, y: myItemModel.imageCurrentZoomScale)
        }else {
            imageView.transform = .identity
        }

        setNeedsLayout()
    }
    
}
