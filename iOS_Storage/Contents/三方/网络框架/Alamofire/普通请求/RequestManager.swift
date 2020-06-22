//
//  RequestManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/2/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RequestManager {
    
    /// 请求JSON
    static func requestJSON(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        success: ((JSON) -> ())?,
        failure: ((String) -> ())?) {
        
        commonRequest(url: url, method: method, parameters: parameters, encoding: encoding, headers: headers, failure: failure)?.responseJSON { (response) in
            switch response.result {
            case .success(let json):
                success?(JSON(json))
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        }
        
    }
    
    
    /// 请求String
    static func requestString(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        success: ((String) -> ())?,
        failure: ((String) -> ())?) {
        
        commonRequest(url: url, method: method, parameters: parameters, encoding: encoding, headers: headers, failure: failure)?.responseString { (response) in
            switch response.result {
            case .success(let resultString):
                success?(resultString)
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        }
        
    }
    
    
    // 构建request，通用方法
    private static func commonRequest(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        failure: ((String) -> ())?)
        -> DataRequest? {
            
            guard let url: URL = URL(string: url) else {
                failure?("url解析错误")
                return nil
            }
            return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            
    }
    
    
}

