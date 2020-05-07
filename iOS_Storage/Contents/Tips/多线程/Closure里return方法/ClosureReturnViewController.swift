//
//  ClosureReturnViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/6.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ClosureReturnViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let a = returnInClosure()
        print(a)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(getTaobaoTimeStampAction())
    }
    
    private func returnInClosure() -> String {
        
        let queue = DispatchQueue.init(label: "myQueue")
        
        var objectID = ""
        
        let semaphore = DispatchSemaphore(value: 0)
        
        queue.asyncAfter(deadline: .now()+2) {
            objectID = "22"
            semaphore.signal()
        }
        
        semaphore.wait()
        
        return objectID;
    }
    
    
    // 获取淘宝时间戳
    // dead lock, need fix
    func getTaobaoTimeStampAction() -> String {
        
        let url = URL.init(string: "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp")!
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var t = ""
        
        let queue = DispatchQueue.init(label: "myQueue")
        
        queue.async {
            AF.request(url).responseJSON { (response) in
                switch response.result {
                case .success(let jsonData):
                    let dict = JSON(jsonData)
                    t = dict["data"]["t"].stringValue
                    semaphore.signal()
                case .failure(let info):
                    SVProgressHUD.showError(withStatus: info.localizedDescription)
                    semaphore.signal()
                }
            }
        }
        
        semaphore.wait()
        
        print("timestamp")
        
        return t
    }
    
}
