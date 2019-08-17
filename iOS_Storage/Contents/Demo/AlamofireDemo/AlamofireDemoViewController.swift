//
//  AlamofireDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadCookData(with: "ss", success: { (d) in
            
        }) { (msg) in
            
        }
    }
    
    func loadCookData(with name: String, success responseDict: @escaping ([String: Any]) -> (), failure msg: (String) -> ()) {
        let urlString = "http://apis.juhe.cn/cook/query"
        var paraDict: [String : Any] = [:]
        paraDict["menu"] = "小炒肉"
        paraDict["key"] = "66864d74d580156ac49d63e1487a578a"
//        Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).response {response in
//
//        }
        
        Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print(data)
        }
    }

}
