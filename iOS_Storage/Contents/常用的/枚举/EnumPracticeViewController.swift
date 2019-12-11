//
//  EnumPracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

private enum MonitorSettingType: String {
    case monitor // 频道
    case region  // 城市
    case list    // 网站
}

private enum ShoesQuality {
    
    case new
    case flaw
    case dressed
    case secondHand
    
    var info: (desc: String, code: Int) {
        get {
            switch self {
            case .new:
                return ("全新闲置", 100)
            case .flaw:
                return ("全新瑕疵", 200)
            case .dressed:
                return ("轻微穿着", 300)
            case .secondHand:
                return ("二手穿着", 400)
            }
        }
    }
    
}

enum UserDetailType {
    case person(isOwn: Bool, userID: String?) // 个人（是否是自己）
    case subscribe(subscribeID: String)       // 订阅（订阅号ID）
}

fileprivate class UserDetail {
    
    var type: UserDetailType
    
    init(type: UserDetailType) {
        self.type = type
    }
    
}

class EnumPracticeViewController: CQBaseViewController {
    
    var selectedQualityCode: Int?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let alertController = UIAlertController(title: "选择球鞋成色", message: nil, preferredStyle: .actionSheet)
        let array: [ShoesQuality] = [.new, .flaw, .dressed, .secondHand]
        array.forEach { (quality) in
            let action = UIAlertAction(title: quality.info.desc, style: .default) { (action) in
                self.selectedQualityCode = quality.info.code
            }
            alertController.addAction(action)
        }
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
//        let string = "region"
//        let type = MonitorSettingType.region
//
//        if string == type.rawValue {
//            print("相等")
//        } else {
//            print("不相等")
//        }
        
        let label = UILabel.init(frame: CGRect.init(x: 90, y: 90, width: 200, height: 30))
        view.addSubview(label)
        label.backgroundColor = .gray
        label.font = .systemFont(ofSize: 13)
        label.text = "hehehhehheheheh"
        
        let width = Tool.getLabelWidthWith(text: label.text!, font: label.font, maxWidth: 200)
        
        label.width = width
        
        let user = UserDetail(type: .person(isOwn: false, userID: "111"))
        print(user.type)
        
//        switch user.type {
//        case .person(isOwn: true, _):
//            print("is own")
//        case .person(isOwn: false, userID: let ID)
//            print("not own, ")
//        case .subscribe:
//            print("sub")
//        }

let type = UserDetailType.person(isOwn: false, userID: "001")

switch type {
case .person(isOwn: true, _):
    print("is own")
case .person(isOwn: false, let userID):
    print("is other \(userID ?? "")")
case .subscribe(let subscribeID):
    print("订阅ID:\(subscribeID)")
}
        
        
        
    }
    
}
