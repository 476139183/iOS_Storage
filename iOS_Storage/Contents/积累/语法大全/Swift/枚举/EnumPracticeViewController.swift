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

fileprivate enum UserType {
    case person   // 个人
    case official(isTop: Bool, remindEnabled: Bool) // 订阅（置顶，提醒）
}

class EnumPracticeViewController: CQBaseViewController {
    
    var selectedQualityCode: Int?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let type = UserType.official(isTop: false, remindEnabled: false)
        switch type {
        case .official(isTop: true, _):
            print("is top")
        case .official(isTop: false, _):
            print("not top")
        case .official(isTop: _, remindEnabled: true):
            print("remind")
        case .official(isTop: _, remindEnabled: false):
            print("not remind")
        default:
            break
        }
        
        let type2 = UserType.official(isTop: true, remindEnabled: true)
        switch type2 {
        case .official(isTop: true, remindEnabled: true):
            print("都是true")
        default:
            print("不都是")
        }
        
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
        
        let testButton = UIButton(type: .system)
        view.addSubview(testButton)
        testButton.setTitle("test", for: .normal)
        testButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        testButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    @objc private func buttonClicked() {
        test2()
    }
    
}


// MARK: - 枚举值

// Swift 枚举中支持以下四种关联值类型：
// - 整形(Integer)
// - 浮点数(Float Point)
// - 字符串(String)
// - 布尔类型(Boolean)

extension EnumPracticeViewController {
    
    private enum PlayState: String {
        case start
        case stop
    }
    
    private func test1() {
        print(PlayState.start.rawValue)
        print(PlayState.stop.rawValue)
        
        // 关联值的枚举通过 rawValue 构造一个枚举
        let state1 = PlayState.init(rawValue: "ddd")
        print(state1) // nil
        
        let state2 = PlayState.init(rawValue: "stop")
        print(state2) // stop
    }
    
}


// MARK: - 枚举比较

extension EnumPracticeViewController {
    
    private enum ShoeType {
        case nike
        case adidas
    }
    
    private func test2() {
        let type1 = ShoeType.nike
        if type1 == ShoeType.nike {
            print("equal")
        }
    }
    
}
