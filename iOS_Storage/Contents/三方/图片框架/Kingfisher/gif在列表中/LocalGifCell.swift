//
//  LocalGifCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Kingfisher

class LocalGifCell: UITableViewCell {

    @IBOutlet weak var imgV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgV.backgroundColor = .orange
        
        let path = Bundle.main.url(forResource: "yeezy_loading", withExtension: "gif")
        let resource = LocalFileImageDataProvider(fileURL: path!)
        imgV.kf.setImage(with: resource)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
