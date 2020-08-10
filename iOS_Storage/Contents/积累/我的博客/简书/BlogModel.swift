//
//  BlogModel.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation
import HandyJSON

class BlogEntity: BlogBaseModel {
    var object: BlogObject?
}

class BlogObject: BlogBaseModel {
    var type: Int = 0
    var data: BlogModel?
}

class BlogModel: BlogBaseModel {
    var id = 0
    var title = ""
    var slug = ""
    var list_image_url = ""
    var first_shared_at = ""
    var public_abbr = ""
    var paid = false
    var commentable = false
    var is_top = false
    var total_fp_amount = 0
    var public_comments_count = 0
    var total_rewards_count = 0
    var likes_count = 0
    var views_count = 0
    var user: BlogUser?
}

class BlogUser: BlogBaseModel {
    var id = 0
    var nickname = ""
    var slug = ""
    var avatar = ""
}

/// 详情
class BlogDetailModel: BlogBaseModel {
    var public_title = ""
    var free_content = ""
}

class BlogBaseModel: HandyJSON {
    required init() {}
}
