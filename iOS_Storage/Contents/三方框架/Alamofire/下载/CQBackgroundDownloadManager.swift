//
//  CQBackgroundDownloadManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/8/19.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import Alamofire

class CQBackgroundDownloadManager: NSObject {
    @objc static let shared = CQBackgroundDownloadManager()
    
    lazy var manager: SessionManager = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.cq.AlamofireTest.demo")
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        //        configuration.timeoutIntervalForRequest = 10
        //        configuration.timeoutIntervalForResource = 10
        //        configuration.sharedContainerIdentifier = "group.com.lgcooci.AlamofireTest"
        
        return SessionManager(configuration: configuration)
    }()
}
