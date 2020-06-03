//
//  RequestManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation
import Alamofire

// Alamofire.request(urlString, method: .get, parameters: paraDict, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

class RequestManager {
    
    static func request(url: String, method: HTTPMethod, parameters :Parameters? = nil, success: ((HTTPURLResponse?) -> ())?, failure: ((String) -> ())?) {
        // 业务的 heders
        var headers: HTTPHeaders = [:]
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success(_): // 与服务器交互成功
                success?(response.response)
            case .failure(_):
                failure?(response.error?.localizedDescription ?? "网络不给力")
            }
            
        }
    }
    
    
}
