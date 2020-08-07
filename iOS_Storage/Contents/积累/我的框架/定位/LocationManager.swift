//
//  LocationManager.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/22.
//  Copyright © 2019 蔡强. All rights reserved.
//

import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    /// 当前位置
    var currentLocation: CLLocation?
    
    static let shared = LocationManager()
    private override init(){}
    
    private var successHandler: ((_ location: CLLocation?) -> ())?
    private var failureHandler: ((_ error: Error?) -> ())?
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 50
        return manager
    }()
    
    /// 获取当前位置
    func getLocation(success successHandler: ((CLLocation?) -> ())?, failure failureHandler: ((Error?) -> ())?) {
        self.successHandler = successHandler
        self.failureHandler = failureHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    // MARK: - CLLocationManagerDelegate
    
    // 定位成功
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.first
        if let handler = self.successHandler {
            handler(locations.first)
        }
        locationManager.stopUpdatingLocation()
    }
    
    // 定位失败
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let handler = self.failureHandler {
            handler(error)
        }
        locationManager.stopUpdatingLocation()
    }
    
}
