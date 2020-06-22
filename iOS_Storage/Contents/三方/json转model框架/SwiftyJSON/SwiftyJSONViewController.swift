//
//  SwiftyJSONViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwiftyJSONViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        test1()
        
    }
    
}


extension SwiftyJSONViewController {
    
    private func test1() {
        // 读取本地json
        // 被安排得明明白白
        if let path = Bundle.main.path(forResource: "json_demo", ofType: "json") {
            do {
                // 读取jons
                let jsonStr = try String(contentsOfFile: path)
                print(jsonStr)
                // json 转 data
                let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false)
                // 转为SwiftyJSON的JSON
                let json = JSON(jsonData!)
                
                // SwiftyJSON不怕null
                var msg = json["msg"].stringValue
                msg.append("ss")
                print(msg)
                
                
                print("来了")//
                
            } catch {
                print("出错了")
            }
        } else {
            print("文件未找到")
        }
    }
    
    private func test2() {
        let myJSON = getJSON(resource: "json_demo")
        if let jsonData2 = (myJSON as AnyObject).data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false) {
            let json = JSON(jsonData2)
            let name = json[0]["name"].stringValue
            print(name)
        }
        
        
        // 读取本地json
        if let path = Bundle.main.path(forResource: "json_demo", ofType: "json") {
            do {
                let str = try String(contentsOfFile: path)
                print(str)
                
                //let person = Person(JSONString: str)
                
                
                
            } catch {
                
            }
        } else {
            print("文件未找到")
        }
        
        
        let jsonStr = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
        
        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let json = JSON(jsonData)
            let name = json[0]["name"].stringValue
            print(name)
        }
        
        //        var animal = Animal()
        //        animal.name = json["name"].stringValue
        //        print(json["name"].stringValue)
        // print(animal.name)
    }
    
}

extension SwiftyJSONViewController {
    
    func getJSON(resource: String) -> Any {
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                return jsonResult
            } catch {
                // maybe lets throw error here
                return []
            }
        }
        return []
    }
    
}
