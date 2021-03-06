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

    var model: BlogModel? {
        didSet {
            guard let model = self.model else {
                return
            }
            self.nameLabel.text = model.title
            //self.blogImageView.kf.setImage(with: URL.init(string: model.list_image_url))
            self.blogImageView.kf.setImage(with: URL.init(string: model.list_image_url), placeholder: UIImage.init(named: "iu_header"))
        }
    }
    
}
