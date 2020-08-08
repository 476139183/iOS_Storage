//
//  BlogCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/8.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BlogCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var blogImageView: UIImageView!

    var model: BlogEntity? {
        didSet {
            guard let model = self.model else {
                return
            }
//            self.nameLabel.text = model.object?.data?.title
//            self.blogImageView.kf.setImage(with: URL.init(string: (model.object?.data!.list_image_url)!))
        }
    }
    
}
