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
        
        DispatchQueue.global().sync {
//            let a = self.returnInClosure()
//            print(a)
//
            print("111")
        }
        
        DispatchQueue.global().sync {
            sleep(2)
            print(Thread.current)
            print("global sync")
            self.view.backgroundColor = self.getBgColor()
        }
        
        print("viewDidLoad")
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(getTaobaoTimeStamp())
    }
    
    private func returnInClosure() -> String {
        
        let queue = DispatchQueue.global()
        
        var objectID = ""
        
        let semaphore = DispatchSemaphore(value: 0)
        
        queue.asyncAfter(deadline: .now()+2) {
            objectID = "22"
            semaphore.signal()
        }
        
        // 会卡住调用这句话的线程
        semaphore.wait()
        
        return objectID;
    }
    
    private func getBgColor() -> UIColor {
        
        DispatchQueue.global().sync {
            return UIColor.red
        }
        
        
        
        //return .blue
    }
    
    // 获取淘宝时间戳
    func getTaobaoTimeStamp() -> String {
        
        let url = URL.init(string: "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp")!
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var t = ""
        
        let queue = DispatchQueue.global()
        
        AF.request(url).response(queue: queue) { (response) in
            switch response.result {
            case .success(let jsonData):
                print(Thread.current)
                let dict = JSON(jsonData)
                t = dict["data"]["t"].stringValue
                semaphore.signal()
            case .failure(let info):
                SVProgressHUD.showError(withStatus: info.localizedDescription)
                semaphore.signal()
            }
        }
        
        
        semaphore.wait()
        
        print("timestamp")
        
        return t
    }
    
}
