//
//  EnumPracticeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/12.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

enum MonitorSettingType: String {
    case monitor // 频道
    case region  // 城市
    case list    // 网站
}

enum TradeQuality {
    case new
    case flaw
    case dressed
    case secondHand
    
    var desc: String {
        get {
            switch self {
            case .new:
                return "全新闲置"
            case .flaw:
                return "全新瑕疵"
            case .dressed:
                return "轻微穿着"
            case .secondHand:
                return "二手穿着"
            }
        }
    }
}

class EnumPracticeViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let string = "region"
        let type = MonitorSettingType.region
        
        if string == type.rawValue {
            print("相等")
        } else {
            print("不相等")
        }
        
        let label = UILabel.init(frame: CGRect.init(x: 90, y: 90, width: 200, height: 30))
        view.addSubview(label)
        label.backgroundColor = .gray
        label.font = .systemFont(ofSize: 13)
        label.text = "hehehhehheheheh"
        
        let width = Tool.getLabelWidthWith(text: label.text!, font: label.font, maxWidth: 200)
        
        label.width = width
    }

}
