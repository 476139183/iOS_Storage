//
//  HandyJSONViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import HandyJSON

class HandyJSONViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //test1()
        //testWithAlamofire()
        //testWithArrayJSON()
        //testStructModel()
        testStructModel2()
    }
    
}

extension HandyJSONViewController {
    
    private class BasicTypes: HandyJSON {
        var int: Int = 100
        var doubleOptional: Double?
        var stringImplicitlyUnwrapped: String!
        
        required init() {}
    }
    
    
    private func test1() {
        
        //        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":2}"
        let jsonString = "{\"doubleOptional\":null,\"stringImplicitlyUnwrapped\":\"hello\"}"
        if let object = BasicTypes.deserialize(from: jsonString) {
            print(object.int)
            print(object.doubleOptional ?? 0)
            print(object.stringImplicitlyUnwrapped)
            
            let a = object.int + 5
            print(a)
            
            let b = object.doubleOptional ?? 0 + 22
            print(b)
        }
        
    }
    
    
    private func testWithAlamofire() {
        
        let _ = """
{
    "resultcode": "101",
    "reason": "错误的请求KEY",
    "result": null,
    "error_code": 10001
}
"""
        
        class ResultModel: HandyJSON {
            
            var resultcode: Int = 200
            var reason: String = ""
            var result: String = ""
            var error_code: String = ""
            
            required init() {
                
            }
        }
        // url
        let urlString = "http://apis.juhe.cn/mobile/get"
        // 参数
        var paraDict: [String : Any] = [:]
        paraDict["phone"] = "12345"
        paraDict["key"] = "66864d74d580156ac49d63e1487a578a"
        // 请求
        RequestManager.requestString(url: urlString, method: .get, success: { (json) in
            let model = ResultModel.deserialize(from: json)
            print(model)
        }, failure: { (info) in
            print(info)
        })
    }
    
    
    private func testWithArrayJSON() {
        
        class BaseResultModel: HandyJSON {
            var result: Bool = true
            var msg: String = ""
            var code: Int = 0
            
            required init() {}
        }
        
        class ItemModel: HandyJSON {
            var name: String = ""
            var sale_amount: Int = 0
            var gross_margin_ratio: Float = 0.0
            required init() {}
        }
        
        class DataModel: HandyJSON {
            var category_sale: [ItemModel] = []
            required init() {}
        }
        
        class DetailModel: BaseResultModel {
            var data: DataModel?
        }
        
        
        if let path = Bundle.main.path(forResource: "json_demo", ofType: "json") {
            do {
                // 读取json
                let jsonStr = try String(contentsOfFile: path)
                print(jsonStr)
                
                if let model = DetailModel.deserialize(from: jsonStr) {
                    print(model.result)
                    print(model.data?.category_sale.count)
                    let first = model.data?.category_sale.first
                    print(first?.name)
                }
            } catch {
                print("出错了")
            }
        } else {
            print("文件未找到")
        }
    }
    
    
}

// MARK: - 使用纯 struct 类型的 model

private struct CartoonModel: HandyJSON {
    var name: String = ""
    var sale_amount: Int = 0
    var gross_margin_ratio: Float = 0.0
}

private protocol BaseResponseModel: HandyJSON {
    var result: Bool { get set }
    var msg: String { get set }
    var code: Int { get set }
}

private struct CartoonResponseModel: BaseResponseModel {
    var result: Bool = true
    var msg: String = ""
    var code: Int = 0
    
    var data: [CartoonModel] = []
}

extension HandyJSONViewController {
    
    private func testStructModel() {
        
        if let path = Bundle.main.path(forResource: "handy_json", ofType: "json") {
            do {
                // 读取json
                let jsonStr = try String(contentsOfFile: path)
                print(jsonStr)
                
                if let model = CartoonResponseModel.deserialize(from: jsonStr) {
                    print(model.result)
                    print(model.data.count)
                    let first = model.data.first
                    print(first!.name)
                }
                
            } catch {
                print("出错了")
            }
        } else {
            print("文件未找到")
        }
        
    }
    
}


// MARK: - 使用纯 struct 的 model，升级版

private struct Response<T: HandyJSON>: HandyJSON {
    var result: Bool = true
    var msg: String?
    var code: Int = 0
    
    var data: T?
}

// 限制遵循HandyJSON的数组，它的元素也必须遵循HandyJSON
extension Array: HandyJSON where Element: HandyJSON {
    
}

extension Array: _ExtendCustomModelType where Element: _ExtendCustomModelType {
    
}

private struct Cartoon: HandyJSON {
    var name: String = ""
    var sale_amount: Int = 0
    var gross_margin_ratio: Float = 0.0
}

extension HandyJSONViewController {
    
    private func testStructModel2() {
        
        if let path = Bundle.main.path(forResource: "handy_json", ofType: "json") {
            do {
                // 读取json
                let jsonStr = try String(contentsOfFile: path)
                print(jsonStr)
                
                // json 转 model
                if let model = Response<[Cartoon]>.deserialize(from: jsonStr) {
                    print(model.data?.count ?? 0)
                }
                
            } catch {
                print("出错了")
            }
        } else {
            print("文件未找到")
        }
        
    }
    
}
