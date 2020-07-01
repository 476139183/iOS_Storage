//
//  CodableDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CodableDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let swiftLanguage = Language.init(name: "Swift", version: 5.2)
        
        var encodedData: Data = Data()
        // encode
        do {
            encodedData = try JSONEncoder().encode(swiftLanguage)
        } catch {}
        
        // decode
        let jsonString: String = String(data: encodedData, encoding: .utf8) ?? ""
        print(jsonString)
        
    }
    
}

// 遵循 Codable 协议
fileprivate struct Language: Codable {
    var name: String
    var version: Float
}
