//
//  ObjectMapperDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/7/25.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import ObjectMapper

class ObjectMapperDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonStr = "{\n" +
            "\"username\": \"牵手生活\",\n" +
            "\"age\": 39,\n" +
            "\"weight\": 62,\n" +
            "\"arr\": [\"Mark\",\"Li\"],\n" +  //注意map的名称与实体对象不一致
            "\"dict\":{\"like\":\"体育\",\"money\":23},\n" + //注意map的名称与实体对象不一致
            "\"best_friend\": {\n" +     //注意map的名称与实体对象不一致
            "\"username\": \"牵手小孩\",\n" +
            "\"age\": 24,\n" +
            "\"weight\": 62,\n" +
            "\"arr\": [\"sqlserver\",\"java\",\"swfit\",\"android\",\"ios\"],\n" +
            "\"birthday\": 20010902\n" +
            "},\n" +
            "\"birthday\": 20010902\n" +
        "}"
        
        
        //json字符串转model对象
        let user = User(JSONString: jsonStr) //把json字符串转换为user对象，user对象是嵌套对象
        print(user)  //设置断点查看转换后的结果是否正确
        
        
        //Convert a model object to a JSON string:
        let newJSONStr = user?.toJSONString(prettyPrint: true) //把model对象转换为json字符串
        print(newJSONStr)  //打印出来看看
        
        
        // 读取本地json
        if let path = Bundle.main.path(forResource: "person_info", ofType: "json") {
            do {
                let str = try String(contentsOfFile: path)
                print(str)
                
                let person = Person(JSONString: str)
                
                print("来了")
                print(person?.ID)
                
            } catch {
                
            }
        } else {
            print("文件未找到")
        }
        
    }

}

private class Person: Mappable {
    var name: String?
    var sex: Int?
    var ID: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name   <- map["name"]
        sex    <- map["sex"]
        ID     <- map["id"]
    }
}

private class User: Mappable {
    var username: String?
    var age: Int?
    var weight: Double!
    var array: [Any]?
    var dictionary: [String : Any] = [:]
    var bestFriend: User?                       // Nested User object
    var friends: [User]?                        // Array of Users
    var birthday: Date?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        array       <- map["arr"]//这里注意map的是dict,也就是说在json字符串中编写为dict
        dictionary  <- map["dict"]  //这里注意map的是dict,也就是说在json字符串中编写为dict
        bestFriend  <- map["best_friend"] ////这里注意map的是best_friend,也就是说在json字符串中编写为best_friend
        friends     <- map["friends"]
        birthday    <- (map["birthday"], DateTransform())
    }
}
