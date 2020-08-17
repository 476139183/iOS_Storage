//
//  ArchiveDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ArchiveDemosViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let order1 = Order()
        order1.orderName = "order1"
        order1.userName = "Jack"
        
        // 归档
        NSKeyedArchiver.archiveRootObject(order1, toFile: getSavePath())
        
    }
    
    private func getSavePath()->String {
        let cacheDir:String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let localPath:String = cacheDir.appending("TempTest.plist")
        return localPath;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let order:Order = NSKeyedUnarchiver.unarchiveObject(withFile: getSavePath()) as! Order
        print(order.orderName)
        print(order.userName)
    }

}

class Order: NSObject, NSCoding {
    
    var orderName:String = ""
    var userName:String = ""

//    init(orderName:String, userName:String) {
//        self.orderName = orderName
//        self.userName = userName
//        super.init()
//    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.orderName = aDecoder.decodeObject(forKey: "OrderName") as! String
        self.userName = aDecoder.decodeObject(forKey: "UserName") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.orderName, forKey:"OrderName")
        
        aCoder.encode(self.userName, forKey: "UserName")
    }
    
}
