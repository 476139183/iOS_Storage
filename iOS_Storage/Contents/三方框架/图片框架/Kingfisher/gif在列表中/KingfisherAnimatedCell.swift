//
//  KingfisherAnimatedCell.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Kingfisher

class KingfisherAnimatedCell: UITableViewCell {

    @IBOutlet weak var gifImageView: AnimatedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        guard let url = URL(string: "https://dingstock-community.obs.cn-east-2.myhuaweicloud.com/evyCVWz6AC/s0mnNsxsE6/0.gif") else { return }
        gifImageView.kf.setImage(with: url)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
